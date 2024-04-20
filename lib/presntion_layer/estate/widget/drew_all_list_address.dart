import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/helper/extenstion.dart';

import '../../../busines_logic_layer/address/address_cubit.dart';
import '../../../shared_widget/app_style.dart';
import 'edit_address_view.dart';

Widget drewAllAddress({address , required BuildContext context}) {
  var  isTaplet = MediaQuery.of(context).size.shortestSide>600;
  return ListView.builder(
    shrinkWrap: true,
      itemCount: address.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        context.read<AddressCubit>().getRemoveToAddress(
                            context: context,
                            addressId: address[index].id,
                            index: index);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  InkWell(
                      onTap: () {
                        context.push(
                            EditAddressView(
                              address_address_1: '${address[index].addressAddress1}',
                              address_address_2: '${address[index].addressAddress2}',
                              address_email: '${address[index].addressEmail}',
                              address_first_name: '${address[index].addressFirstName.toString()}',
                              address_mobile: '${address[index].addressMobile}',
                            ),
                            context);
                      },
                      child: Icon(
                        Icons.edit_location_outlined,
                        color: Colors.black,
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${address[index].addressFirstName.toString()}"),
                    Text(
                      "العنوان الاساسى الاول ",
                      style: style14Font18Weight800eint,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    address[index].addressEmail == ""
                        ? Text("لا يتوفر")
                        : Text("${address[index].addressEmail}"),
                    Text(
                      "حساب العنوان",
                      style: style14Font18Weight800eint,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${address[index].addressAddress1}"),
                    Text(
                      "العنوان الاول",
                      style: style14Font18Weight800eint,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${address[index].addressAddress2}"),
                    Text(
                      "العنوان التانى",
                      style: style14Font18Weight800eint,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${address[index].addressMobile}"),
                    Text(
                      "رقم العنوان",
                      style: style14Font18Weight800eint,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    address[index].regionName == null
                        ? Text("لايتوفر")
                        : Text("${address[index].regionName}"),
                    Text(
                      " المحافظة",
                      style: style14Font18Weight800eint,
                    )
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200, width: 4),
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)),
          width: 327.w,
          height:isTaplet?240.h: 265.h,
        );
      });
}
