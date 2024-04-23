import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared_widget/app_style.dart';
Widget drewCustomSearchField({required BuildContext context ,Function(String)? onTab,Function(String)? onTabSub,required TextEditingController search }) {
  return Padding(
    padding: const EdgeInsets.only(right: 18,top: 12),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightGreen.shade50,
                  borderRadius: BorderRadius.circular(80)),

              width:310,
              height: 48,
              child: TextFormField(

                validator:  (String? value) {
                  if (value == null || value.isEmpty) {
                    return "ادخال اسم المنتج";
                  }
                },
                onFieldSubmitted:onTabSub,
                controller: search,
                onChanged: onTab,
                style:style1Font11Weight500,
                textDirection: TextDirection.rtl,
                //      controller: context.read<LoginViewModel>().textEditingControllerMobile,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  suffixIconConstraints:
                      BoxConstraints(maxHeight: 50, maxWidth: 35),
                  errorStyle: const TextStyle(fontFamily: "BigVesta"),
                  hintText: "ابحث عن ماتريد؟",
                  hintStyle:GoogleFonts.anybody(
                    fontSize: 14,
                    letterSpacing:2 ,
                    color: Colors.grey

                  ),
                  filled: true,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
