import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/address/address_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/estate/widget/drew_regions.dart';
import 'package:hoper/shared_widget/statusapp/loadingScreen.dart';

import '../../shared_widget/app_style.dart';
import '../../shared_widget/custom_text_form_field.dart';
import '../../shared_widget/drew_background_color.dart';
import '../auth/widget_auth/drew_button.dart';
import 'location_live_address.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  int? tappedIndex;

  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<AddressCubit>(context).getRegionFromRepo();
    super.setState(fn);
  }

  @override
  void initState() {
    BlocProvider.of<AddressCubit>(context).getRegionFromRepo();
    super.initState();
    tappedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    List<String> apartment = ["فيلا", "منزل", "كمباوند", "فندق"];
    return Scaffold(
      body: context.watch<AddressCubit>().regionData == null
          ? LoadingScreen()
          : SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    drewBackGroundColors(),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(16.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "اضافة عقار",
                                style: style16Font18Weight800eint.copyWith(
                                    color: HexColor("#49B673")),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Image.asset("assets/images/Back - Solid.png"),
                            ],
                          ),
                        ), //Back - Solid.png
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 260.w,
                                height: 70.h,
                                margin: EdgeInsets.all(8.sp),
                                child: Text(
                                  textAlign: TextAlign.end,
                                  "من فضلك املأ بيانات العقار الخاص بك",
                                  style: style1Font20Weight400,
                                ))
                          ],
                        ),
                        SizedBox(
                            width: 324.w,
                            height: 44.h,
                            child: AppTextFormField(
                              controller: context
                                  .watch<AddressCubit>()
                                  .address_first_name,
                              hentStyle: style1Font12Weight500Heint,
                              //   suffixIcon: icon,
                              //    pIcon: pIcon,
                              hintText:
                                  "اسم العقار الاول", //=>address_first_name
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                              },
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.all(12.sp),
                                child: Text(
                                  "نوع العقار",
                                  style: style16Font18Weight800eint.copyWith(
                                      color: HexColor("#49B673")),
                                )),
                          ],
                        ),
                        Container(
                          width: 350.w,
                          height: 150.h,
                          child: ListView.builder(
                              itemCount: apartment.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                //  tappedIndex ==index;
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      tappedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      "${apartment[index]}",
                                      style: style16Font18Weight800eint
                                          .copyWith(fontSize: 12),
                                    )),
                                    margin: EdgeInsets.all(18),
                                    width: 58.w,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: tappedIndex == index
                                            ? HexColor("#234F68")
                                            : Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.all(7.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              drewDropDownRegionEdit(
                                  context: context, height: 50.h, width: 45.w)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
        SizedBox(
            width: 324.w,
            height: 44.h,
            child: AppTextFormField(
              controller: context
                  .watch<AddressCubit>()
                  .address_email,
              hentStyle: style1Font12Weight500Heint,
              //   suffixIcon: icon,
              //    pIcon: pIcon,
              hintText:
              "حساب العنوان", //=>address_first_name
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return null;
                }
              },
            )),

                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                            width: 324.w,
                            height: 44.h,
                            child: AppTextFormField(
                              controller: context
                                  .watch<AddressCubit>()
                                  .address_mobile,
                              hentStyle: style1Font12Weight500Heint,
                              //   suffixIcon: icon,
                              //    pIcon: pIcon,
                              hintText:
                              "رقم العنوان", //=>address_first_name
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                              },
                            )),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: 155.w,
                                height: 44.h,
                                child: AppTextFormField(
                                   controller:    context.watch<AddressCubit>().address_address_2,
                                  hentStyle: style1Font12Weight500Heint,
                                  //   suffixIcon: icon,
                                  //    pIcon: pIcon,
                                  hintText: " العنوان التانى",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return null;
                                    }
                                  },
                                )),
                            SizedBox(
                                width: 155.w,
                                height: 44.h,
                                child: AppTextFormField(
                                   controller:    context.watch<AddressCubit>().address_address_1,
                                  hentStyle: style1Font12Weight500Heint,
                                  //   suffixIcon: icon,
                                  //    pIcon: pIcon,
                                  hintText: " العنوان الاول",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return null;
                                    }
                                  },
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        drewCustomButton(
                            name: "اضافة عنوان",
                            on: () {
                              context.read<AddressCubit>().addAddressFromRepo(context: context);
                              context.push(LiveLocation(), context);
                            },
                            context: context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget drewFromAddState({controller, name}) {
    return Container(
      width: 327.w,
      height: 72.h,
      child: TextFormField(

        textAlign: TextAlign.end,
        controller: null,
        minLines: 4,
        maxLines: 6,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          hintText: name,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
