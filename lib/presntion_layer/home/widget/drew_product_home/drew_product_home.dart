import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/favourite/favourite_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/product_details/products_details.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../data_layer/model/products/products_model.dart';
import '../../../../shared_widget/app_style.dart';

class DrewHomeProduct extends StatefulWidget {
  List<ProductsModel> productsData = [];


  DrewHomeProduct({super.key, required this.productsData});

  @override
  State<DrewHomeProduct> createState() => _DrewHomeProductState();
}

class _DrewHomeProductState extends State<DrewHomeProduct> {
  @override
  Widget build(BuildContext context) {
  var  isTaplet = MediaQuery.of(context).size.shortestSide>600;
    return SizedBox(
        width: 300.w,
        height: 200.h,
        child: widget.productsData.isEmpty
            ? Center(
                child: Lottie.asset(
                    "assets/lotti/Animation - 1696423727076 (1).json"))
            : GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 5,
                  mainAxisExtent:isTaplet?350.h: 300,
                ),
                itemCount: widget.productsData.length,
                itemBuilder: (context, position) {
                  return InkWell(
                    onTap: () {
                      context.push(
                          widget.productsData[position].images!.isNotEmpty
                              ? ProductsDetailsScreen(
                                  sellerName: widget.productsData[position]
                                              .sellerName ==
                                          " "
                                      ? "لا يوجد اسم لصاحب العقار الان"
                                      : widget.productsData[position].sellerName
                                          .toString(),
                                  productId: widget.productsData[position].id,
                                  sellerInfo: widget.productsData[position]
                                              .sellerInfo ==
                                          null
                                      ? "لا يوجد معلومات لصاحب العقار الان"
                                      : widget.productsData[position].sellerInfo
                                          .toString(),
                                  description: widget.productsData[position]
                                              .bigDescribe ==
                                          ""
                                      ? "لا يوجد وصف لهزا العقار الان"
                                      : widget
                                          .productsData[position].bigDescribe
                                          .toString(),
                                  address: widget
                                              .productsData[position].address ==
                                          ""
                                      ? "لا يوجد عنوان متاح الان"
                                      : widget.productsData[position].address
                                          .toString(),
                                  name: widget.productsData[position].name
                                      .toString(),
                                  image: widget.productsData[position].image
                                      .toString(),
                                  price: widget.productsData[position].price
                                      .toString(),
                                  attrabute:
                                      widget.productsData[position].attributes,
                                )
                              : Text(""),
                          context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(12),
                      width: 250.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: HexColor("#F1FFF6"),
                        //   border: Border.all(color: Colors.black)),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  width: 160.w,
                                  height: 152.h,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.image),
                                  placeholder: (context, url) => Shimmer(
                                    gradient: const LinearGradient(
                                        colors: [Colors.grey, Colors.white]),
                                    child: Container(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  imageUrl: widget.productsData[position].image
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {

                                            },
                                            child: InkWell(
                                                onTap: () {
                                            //      context.read<HomeCubit>().changeCurrentIndex(index: index);
                                                  context
                                                      .read<FavouriteCubit>()
                                                      .getAddFavourite(
                                                      index: position,
                                                      context: context,
                                                      id: context
                                                          .read<
                                                          HomeCubit>()
                                                          .productsModel[position]
                                                          .id);
                                                },
                                                child: Icon(Icons.favorite_border,color: Colors.grey,),)),
                                        SizedBox(
                                          height: 100.h,
                                        ),
                                        Container(
                                            child: InkWell(
                                          onTap: () {

                                          },
                                          child: Container(
                                            width: 85.w,
                                            height: 30.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: HexColor("#32444F"),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${widget.productsData[position].price}جنية",
                                                style: GoogleFonts.tajawal(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                          Text(
                            "${widget.productsData[position].name}",
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: style1Font11Weight500.copyWith(fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          widget.productsData[position].region == null
                              ? Text(
                                  "لم يتم اختيار العنوان",
                                  style: style1Font11Weight500.copyWith(
                                      color: Colors.green,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "${widget.productsData[position].region.toString()}",
                                  textAlign: TextAlign.end,
                                  style: style1Font11Weight500,
                                )
                        ],
                      ),
                    ),
                  );
                }));
  }
}
