import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/busines_logic_layer/address/address_cubit.dart';

import '../../../shared_widget/app_style.dart';

Widget drewDropDownRegionEdit(
    {var height, width, required BuildContext context}) {

  var regSelect= context.watch<AddressCubit>().regionSelect;
  return Container(
    margin: EdgeInsets.only(top: 4),
    alignment: Alignment.center,
    height:45.h,
    width: 100.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.grey.shade100,

    ),
    child: DropdownButton(
      isExpanded: true,
      alignment: Alignment.center,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      iconEnabledColor: Colors.black38,
      underline: Container(),
      elevation: 4,
      value: context.watch<AddressCubit>().regionSelect,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: context
          .watch<AddressCubit>()
          .regionData!
          .map((var items) {
        return DropdownMenuItem(
          alignment: Alignment.center,
          value: items.id,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:1),
            child: Text(
              "${items.name}",style: style1Font11Weight500.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
      onChanged: (var z) {

        context.read<AddressCubit>().regionSelect = z;
       // context.read<AddressCubit>().getDisFromRepo(x: z);
      },
    ),
  );
}