


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget drewImage({image}) {
  return Center(
      child: SizedBox(
        width: double.maxFinite,
        height: 518.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12.sp),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.sp),
                      child: CachedNetworkImage(
                        width: 250.w,
                        height: 180.h,
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.image),
                        placeholder: (context, url) => Shimmer(
                          gradient: const LinearGradient(
                              colors: [Colors.grey, Colors.white]),
                          child: Container(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        imageUrl:image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    height: 512.h,
                  ),
                ],
              );
            }),
      ));
}