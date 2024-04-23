import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/cart/cart_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/product_details/widget/drew_image_details.dart';
import 'package:shimmer/shimmer.dart';

import '../../data_layer/model/products/products_model.dart';
import '../../shared_widget/app_style.dart';
import '../payment.dart';

class ProductsDetailsScreen extends StatefulWidget {
  var image;
  var name;
  var productId;
  var price;
  var sellerName;
  var sellerInfo;
  var address;
  var description;
  List<Attributes>? attrabute = [];

  ProductsDetailsScreen(
      {super.key,
      required this.image,
      this.name,
      this.productId,
      this.sellerInfo,
      this.sellerName,
      this.attrabute,
      this.price,
      this.description,
      this.address});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  drewImage(image: widget.image),
                  drewDetailsBody(),
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(4.sp),
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/images/Favorite - Active - Bi.png"),
                          Image.asset(
                              "assets/images/Favorite - Active - Big.png"),
                          InkWell(
                            onTap: () {
                           //   context.read<CartCubit>().uploadImage(context: context);
                              context.read<CartCubit>().getAddToCart(
                                  context: context,
                                  cartItemId: widget.productId);
                              context.push(ChosePayment(),context);
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                "احجز الان",
                                style: style16Font18Weight800eint,
                              )),
                              width: 180.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                  color: HexColor("#49B673"),
                                  borderRadius: BorderRadius.circular(17)),
                            ),
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }



  Widget drewDetailsBody() {
    return Column(
      children: [
        Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: 360.w,
                height: 55.h,
                child: drewAnyText(text: "${widget.name.toString()}")),
          ],
        ),
        Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          children: [
            drewAnyText(text: "₹${widget.price.toString()}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                margin: EdgeInsets.only(right: 26.sp),
                child: Row(
                  children: [
                    Text(
                      "${widget.address.toString()}",
                      style: style1Font18Weight500eint.copyWith(
                          color: Colors.black),
                    ),
                    Image.asset(
                      "assets/images/Location.png",
                      width: 25.w,
                      height: 25,
                      fit: BoxFit.cover,
                    )
                  ],
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 14.sp),
                      child: Image.asset("assets/images/Chat.png")),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12.sp),
                        child: Column(
                          children: [
                            Text("${widget.sellerName}"),
                            Text("${widget.sellerInfo}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 14.sp),
                          child: CircleAvatar(
                            backgroundColor: Colors.black26,
                          )),
                    ],
                  ),
                ],
              ),
              width: 327.w,
              height: 85.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            drewAnyText(text: "مواصفات العقار"),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 370.w,
                    height: 140.h,
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.description.toString(),
                      maxLines: 5,
                      style: TextStyle(fontSize: 11.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(right: 26.sp),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "خدمات الكمباوند ",
                      style: style1Font18Weight500eint.copyWith(
                          color: Colors.green.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
            widget.attrabute!.isEmpty?Text("لايوجد خدمات متاحة الان"):    Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 290.w,
                      height: 170.h,
                      child: GridView.builder(
                        itemCount: widget.attrabute!.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 14.sp,
                          crossAxisSpacing: 5.sp,
                          mainAxisExtent: 60.h,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                width: 50.w,
                                height: 35.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.grey),
                              ),
                              Text("${widget.attrabute![index].title.toString()}")
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 26.sp),
              child: Image.asset("assets/images/Layout.png"),
            )
          ],
        ),
      ],
    );
  }

  Widget drewAnyText({text})  {
    return Container(
        margin: EdgeInsets.only(left: 10.sp),
        child: Text(
          textAlign: TextAlign.end,
          text.toString(),
          style: style1Font18Weight500eint.copyWith(color: Colors.black),
        ));
  }
}
