import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_state.dart';
import 'package:hoper/busines_logic_layer/payment/payment_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/cart/cart_view.dart';
import 'package:hoper/shared_widget/statusapp/loadingScreen.dart';
import 'package:shimmer/shimmer.dart';

import '../shared_widget/app_style.dart';
import '../shared_widget/drew_background_color.dart';
import 'auth/widget_auth/drew_button.dart';

class ChosePayment extends StatefulWidget {
  const ChosePayment({super.key});

  @override
  State<ChosePayment> createState() => _ChosePaymentState();
}

class _ChosePaymentState extends State<ChosePayment> {
  @override
  Widget build(BuildContext context) {

    setState(() {
      BlocProvider.of<PaymentCubit>(context).getAllPAymentMethods();
    });
    // bool tab = true;
    return Scaffold(
        body: BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is Paymentloading) {
          LoadingScreen();
        }
      },
      builder: (context, state) {
        final pay = BlocProvider.of<PaymentCubit>(context);
        return SafeArea(
          child:pay.pay.isEmpty?LoadingScreen(): SingleChildScrollView(
            child: Stack(
              children: [
                drewBackGroundColors(),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 350.w,
                        height: 400.h,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: pay.pay.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(top: 30.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 6.5)
                                  ],
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BlocConsumer<HomeCubit, HomeState>(
                                      listener: (context, state) {
                                        // TODO: implement listener
                                      },
                                      builder: (context, state) {

                                        return Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 14.sp),
                                              child: InkWell(
                                                onTap: () {
                                              setState(() {
                                                context.read<HomeCubit>().changeCurrentIndex(index: index);
                                              });
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                  context.watch<HomeCubit>().tappedIndex == index?HexColor("#234F68"): Colors.grey,
                                                ),
                                              ),
                                              width: 40,
                                              height: 40,
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${pay.pay[index].name}",
                                          style: style1Font16Weight500eint,
                                        ),
                                        SizedBox(
                                          width: 14.w,
                                        ),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: CachedNetworkImage(
                                                width: 100.w,
                                                height: 60.h,
                                                errorWidget:
                                                    (context, url, error) =>
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
                                                    color: Colors.grey.shade200,
                                                  ),
                                                ),
                                                imageUrl: pay.pay![index].image
                                                    .toString(),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 12,),
                      drewCustomButton(
                          name: "ارسال طلب الحجز",
                          context: context, on: () {
                        context.push(CartView(),context, );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
