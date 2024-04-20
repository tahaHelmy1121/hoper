import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared_widget/statusapp/loadingScreen.dart';

Widget drewSlider({slider}) {
  return Row(
    children: [
      ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
          width: 350.w,
          height: 180.h,
          child: CarouselSlider.builder(
              itemCount: slider.length,
              itemBuilder: (context, position, index) {
                return Container(
                    decoration: BoxDecoration(),
                    //    width:context.screenwidth*0.9,
                    margin: const EdgeInsets.all(5),
                    //   height: 400,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(
                            30,
                          ),
                        ),
                        child: slider.isEmpty
                            ? LoadingScreen()
                            : Stack(
                                children: [
                                  CachedNetworkImage(
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.image),
                                    placeholder: (context, url) => Shimmer(
                                      gradient: const LinearGradient(
                                          colors: [Colors.grey, Colors.white]),
                                      child: Container(
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                    imageUrl: slider[position].image,
                                    fit: BoxFit.contain,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                          alignment: Alignment.bottomLeft,
                                          child: InkWell(
                                            onTap: () async {
                                              var url = Uri.parse(
                                                  "${slider[position].link}");
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url);
                                              }
                                            },
                                            child: Container(
                                              width: 60.w,
                                              height: 36.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  25))),
                                              child: Image.asset(
                                                  "assets/images/back.png"),
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                      ),
                    ));
              },
              options: CarouselOptions(
                onPageChanged: (value, int) {
                  //     pageIndexNotifier.value = value;
                },
                height: 190.h,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 900),
                autoPlayCurve: Curves.easeInBack,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              )),
        ),
      )
    ],
  );
}
