import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

Widget drewRegions({categorie}) {
  return Container(
    width: 360.w,
    height: 190.h,
    child: ListView.builder(
      itemCount: categorie.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: HexColor("#F1FFF6"),
                  border: Border.all(color: Colors.transparent)),
              width: 300.w,
              height: 160.h,
              child: Row(
                children: [
                  Container(
                      width: 180.w,
                      height: 130.h,
                      child: Column(
                        children: [
                          Text(
                            "${categorie[index].metaTitle}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tajawal(
                                fontSize: 11.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${categorie[index].name}",
                            style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.bold,
                                fontSize: 8.sp,
                                color: Colors.green),
                          )
                        ],
                      )),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CachedNetworkImage(
                      width: 104.w,
                      height: 220.h,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image),
                      placeholder: (context, url) => Shimmer(
                        gradient: const LinearGradient(
                            colors: [Colors.grey, Colors.white]),
                        child: Container(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      imageUrl: categorie[index].image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
