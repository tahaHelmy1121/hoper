import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/busines_logic_layer/address/address_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/estate/add_address_view.dart';
import 'package:hoper/presntion_layer/estate/widget/drew_all_list_address.dart';
import 'package:hoper/presntion_layer/estate/widget/edit_address_view.dart';
import 'package:hoper/shared_widget/statusapp/loadingScreen.dart';
import 'package:lottie/lottie.dart';
import '../../shared_widget/app_style.dart';
import '../../shared_widget/drew_background_color.dart';
import '../../shared_widget/drew_nav_bar.dart';

class AddressView extends StatefulWidget {
  String? liveCotaion;

  AddressView({super.key, this.liveCotaion});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<AddressCubit>(context).getAllAddress();
    super.setState(fn);
  }

  @override
  void initState() {
    BlocProvider.of<AddressCubit>(context).getAllAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var address = context
        .watch<AddressCubit>()
        .addressModel;
    return address == null
        ? LoadingScreen()
        : Scaffold(
      appBar: AppBar(
        title: Text(
          "عناوينى",
          style: style1Font16Weight500eint.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child:address.isEmpty?Column(
          children: [
            Container(
              child: Lottie.asset("assets/lotti/page.json"),
            ),
            InkWell(
              onTap: (){
                context.push(AddAddressView(),context);
              },
              child: Text(
                "قم باضافة  العنوان ",
                style: style14Font18Weight800eint,
              ),
            )
          ],
        ): SingleChildScrollView(
          child: Stack(
            children: [
              drewBackGroundColors(),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 140.w,
                          height: 40.h,
                          child: widget.liveCotaion == null
                              ? null
                              : Text(
                            "${widget.liveCotaion.toString()}",
                            style: style1Font8Weight500.copyWith(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          ":عنوانك الحالى",
                          style: style14Font18Weight800eint,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
              height: MediaQuery.of(context).size.height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: address.isEmpty
                        ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ))
                        : drewAllAddress(address: address, context: context),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
