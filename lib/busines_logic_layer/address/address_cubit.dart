import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoper/data_layer/model/estate/delete_estate_model.dart';
import 'package:hoper/data_layer/repo/edit_address_repo.dart';
import 'package:hoper/data_layer/repo/get_all_address_repo.dart';
import 'package:hoper/helper/massage.dart';
import '../../data_layer/model/estate/add_estate_model.dart';
import '../../data_layer/model/estate/edit_estate_model.dart';
import '../../data_layer/model/estate/estate_model.dart';
import '../../data_layer/model/regions/regions_model.dart';
import '../../data_layer/repo/add_address.dart';
import '../../data_layer/repo/delete_address_repo.dart';
import '../../data_layer/repo/regions_repo.dart';
import '../../helper/cache_helper.dart';
import '../../helper/di/di.dart';
import '../../presntion_layer/estate/get_all_address.dart';
part 'address_state.dart';
class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  List<RegionsModel>? _regionData;

  List<RegionsModel>? get regionData => _regionData;

  set regionData(List<RegionsModel>? value) {
    _regionData = value;
  }

  var _regionSelect = 0;

  get regionSelect => _regionSelect;

  set regionSelect(value) {
    _regionSelect = value;
    emit(AddressSucess());
  }

  bool regionLoad = false;

  getRegionFromRepo() async {
    _regionData = await RegionsRepoistory.getRegionsRepo();
    regionLoad = true;
    _regionSelect = _regionData![0].id;
    emit(AddressSucess());
  }

  TextEditingController address_first_name = TextEditingController();
  TextEditingController address_email = TextEditingController();
  TextEditingController address_address_1 = TextEditingController();
  TextEditingController address_address_2 = TextEditingController();
  TextEditingController address_mobile = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  AddAddressModel addAddressModel = AddAddressModel();

  addAddressFromRepo({required BuildContext context}) async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    addAddressModel = await AddaddressRepo.AddAddressRepo(
      customer: csutomer,
      address_first_name: address_first_name.text,
      address_email: address_email.text,
      address_address_1: address_address_1.text,
      address_address_2: address_address_2.text,
      address_mobile: address_mobile.text,
      region_id: _regionSelect,
    );
    if (addAddressModel.status == 1) {
      MassageApp.snackBar(addAddressModel.reason.toString(), context);
    } else {
      MassageApp.snackBar(addAddressModel.reason.toString(), context);
    }
  }
  List<AddressModel> addressModel =[];
    getAllAddress()async{
      var csutomer = sl<CacheHelper>().getData(key: "id");
     addressModel =await GetAllAddressRepoistory.getAddressRepo(customer:csutomer );
     emit(AddressSucess());
    }
    DeleteAddressModel deleteAddressModel  = DeleteAddressModel();
  getRemoveToAddress({
    addressId,
    context,
    index,
  }) async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    deleteAddressModel = await DeleteAddressRepoistory.geAddressDelete(
      customer: csutomer,
      product_id: addressId,
    );
    emit(AddressSucess());
    getAllAddress();
    if (deleteAddressModel.status == 1) {
      MassageApp.flusherBarErrorMassage(
          context, deleteAddressModel.reason.toString(), "", (flushbar) {});
      //  emit(CartState.success());
      getAllAddress();
    } else {
      MassageApp.flusherBarErrorMassage(
          context, deleteAddressModel.reason.toString(), "", (flushbar) {});
    }
    emit(AddressFalure());
    print("&%^&@#&@^#%@&^#%&^#%@&&&&&&&&&&&&&&&&&&&&&^#%&@^%@#&&^@#");
  }
  EditAddressModel editAddressModel = EditAddressModel();
  editAddressFromRepo({required BuildContext context}) async {
    var csutomer = sl<CacheHelper>().getData(key: "id");
    editAddressModel = await EditAddressRepo.editAddressRepo(
      customer: csutomer,
      address_first_name: address_first_name.text,
      address_email: address_email.text,
      address_address_1: address_address_1.text,
      address_address_2: address_address_2.text,
      address_mobile: address_mobile.text,
      region_id: _regionSelect,
    );
    if (editAddressModel.status == 1) {
      MassageApp.snackBar(editAddressModel.reason.toString(), context);
      Navigator.push(context,MaterialPageRoute(builder:(_)=>AddressView()));
    } else {
      MassageApp.snackBar(editAddressModel.reason.toString(), context);
    }
  }
}
