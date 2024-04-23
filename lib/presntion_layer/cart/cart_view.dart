
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/busines_logic_layer/cart/cart_cubit.dart';
import 'package:hoper/busines_logic_layer/cart/cart_state.dart';
import 'package:hoper/data_layer/model/cart/customer_cart_model.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/cart/widget/drew_details_product.dart';
import 'package:hoper/presntion_layer/cart/widget/drew_image_cart.dart';
import 'package:hoper/presntion_layer/cart/widget/drew_third_pay_cart.dart';
import 'package:hoper/shared_widget/drew_nav_bar.dart';
import 'package:lottie/lottie.dart';
import '../../shared_widget/app_style.dart';
import '../../shared_widget/drew_background_color.dart';
import '../../shared_widget/statusapp/OffLineScreen.dart';
import '../../shared_widget/statusapp/loadingScreen.dart';
import '../auth/widget_auth/drew_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartCubit>().customerCartModel;
    setState(() {
      context.watch<CartCubit>().getCart();
    });

    return Scaffold(
      body: cart.products == null
          ? LoadingScreen()
          : SafeArea(
              child: BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  state.when(
                      initial: () => Text(""),
                      loading: () => LoadingScreen(),
                      success: () => drewCartBody(cart: cart),
                      error: (e) => OffLineScreen());
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        drewCartBody(cart: cart),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget drewCartBody({required CustomerCartModel cart}) {
    return cart.products!.isEmpty?Column(
      children: [
        Container(
          child: Lottie.asset("assets/lotti/page.json"),
        ),
        InkWell(
          onTap: (){
            context.push(CustomNavBar(),context);
          },
          child: Text(
            "قم باضافة بعض المنتجات ",
            style: style14Font18Weight800eint,
          ),
        )
      ],
    ):SingleChildScrollView(
      child: Stack(
        children: [
          drewBackGroundColors(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      //   context.read<CartCubit>().g
                    },
                    child: Text(
                      "الدفع",
                      style: style14Font18Weight800eint,
                    ),
                  ),
                  Image.asset(
                    "assets/images/Back - Solid.png",
                    width: 100,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: 360.w,
                    height: 360.h,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cart.products?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                drewDetailsProduct(cart: cart,index: index),
                                drewCartImage(cart: cart , context: context,index: index),
                              ],
                            ),
                            width: 327.w,
                            height: 160.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 14.sp),
                          child: Text(
                            "تفاصيل الدفع",
                            style: style1Font18Weight500eint,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      drewPayCartTotal(cart: cart),
                    ],
                  ),
                  SizedBox(height: 12.h,),
                  drewCustomButton(context: context,name: "اتمام الحجز", on: () {  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
