import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/favourite/favourite_cubit.dart';
import 'package:hoper/busines_logic_layer/favourite/favourite_state.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/shared_widget/drew_nav_bar.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared_widget/app_style.dart';
import '../home/widget/drew_logo_and_drawer/drew_logo_and_drwer.dart';

class FavouriteView extends StatefulWidget {
  FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<FavouriteCubit>(context).getFav();
    //   BlocProvider.of<FavouriteCubit>(context).getRemoveToFav();
    super.setState(fn);
  }

  @override
  void initState() {
    BlocProvider.of<FavouriteCubit>(context).getFav();
    // BlocProvider.of<FavouriteCubit>(context).getRemoveToFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<FavouriteCubit>().fav;
    //  var pro = context.watch<HomeCubit>().productsModel;
    return BlocBuilder<FavouriteCubit, FavouriteState>(
  builder: (context, state) {
    return Scaffold(
      body: fav.isNotEmpty
          ? RefreshIndicator(
              onRefresh: () {
                return context.read<FavouriteCubit>().getFav();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  //     context.pop();
                                },
                                child: Image.asset(
                                  "assets/images/back.png",
                                  width: 80.w,
                                  height: 100.h,
                                  color: Colors.black,
                                )),
                            Column(
                              children: [
                                drewDrawerAndLogo(),
                                Text(
                                  "المفضلة",
                                  style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 650,
                      child: SafeArea(
                        child: SizedBox(
                            width: 420,
                            height: 450.h,
                            child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 14,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 280.h,
                                ),
                                itemCount: fav.length,
                                itemBuilder: (context, position) {
                                  return Container(
                                    margin: EdgeInsets.all(12),
                                    width: 250.w,
                                    height: 300.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30),
                                        color: HexColor("#F1FFF6"),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Stack(
                                            children: [
                                              CachedNetworkImage(
                                                width: 160.w,
                                                height: 152.h,
                                                errorWidget: (context, url,
                                                        error) =>
                                                    const Icon(Icons.image),
                                                placeholder: (context, url) =>
                                                    Shimmer(
                                                  gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        Colors.grey,
                                                        Colors.white
                                                      ]),
                                                  child: Container(
                                                    color:
                                                        Colors.grey.shade200,
                                                  ),
                                                ),
                                                imageUrl: fav[position]
                                                    .productImage,
                                                fit: BoxFit.cover,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .end,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            context
                                                                .read<
                                                                    FavouriteCubit>()
                                                                .getRemoveToFav(
                                                                    index:
                                                                        position,
                                                                    context:
                                                                        context,
                                                                    favv: fav[
                                                                            position]
                                                                        .productId);
                                                          },
                                                          child: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          )),
                                                      SizedBox(
                                                        height: 100.h,
                                                      ),
                                                      Container(
                                                          child: InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 85.w,
                                                          height: 30.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: HexColor(
                                                                "#32444F"),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "${fav[position].price}جنية",
                                                              style: GoogleFonts.tajawal(
                                                                  fontSize:
                                                                      12,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text("${fav[position].productName}",
                                            textAlign: TextAlign.center,
                                            style: style1Font11Weight500
                                                .copyWith(fontSize: 9.sp)),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 140.w,
                                              height: 20.h,
                                              child: Text(
                                                "${fav[position].productDescribe}",
                                                textAlign: TextAlign.end,
                                                style: GoogleFonts.tajawal(
                                                    fontSize: 7,
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Image.asset(
                                                "assets/images/Location.png")
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                      ),
                    )
                  ],
                ),
              ),
            )
          : drewFavEmpty(context: context),
    );
  },
);
  }

  // Widget drewFavBody({required List<CustomerFavoriteModel> fav}) {
  //   return
  // }

  Widget drewFavEmpty({required BuildContext context}) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              context.push(CustomNavBar(), context);
            },
            child: Image.asset("assets/images/Alert - Success.png")),
        SizedBox(
          height: 14.h,
        ),
        Text(
          "قائمة المفضلة لديك  فارغة",
          textAlign: TextAlign.center,
          style: style1Font25Weight500,
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          "انقر فوق زر إضافة أعلاه لبدء الاستكشاف واختيار \nالعقارات المفضلة لديك.",
          textAlign: TextAlign.center,
          style: style1Font12Weight500Heint,
        )
      ],
    ));
  }
}
