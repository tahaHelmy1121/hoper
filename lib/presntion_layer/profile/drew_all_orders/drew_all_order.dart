import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/favourite/favourite_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/order/order_cubit.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/product_details/products_details.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../data_layer/model/products/products_model.dart';
import '../../../../shared_widget/app_style.dart';
import '../../../data_layer/model/order/order.dart';

class DrewAllOrders extends StatefulWidget {
  // List<OrdersModel> order = [];

  DrewAllOrders({super.key,});

  @override
  State<DrewAllOrders> createState() => _DrewAllOrdersState();
}

class _DrewAllOrdersState extends State<DrewAllOrders> {
  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<OrderCubit>(context).emitOrders();
    super.setState(fn);
  }
  @override
  void initState() {
    BlocProvider.of<OrderCubit>(context).emitOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   var order = context.watch<OrderCubit>().order;
    return SizedBox(
        width: 300.w,
        height: 200.h,
        child:order.isNotEmpty?  GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 5,
              mainAxisExtent: 280.h,
            ),
            itemCount: order.length,
            itemBuilder: (context, position) {
              return InkWell(
                onTap: (){},
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
                              imageUrl:order[position].productimg
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
                                                "${order[position].orderTotal}جنية",
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
                        "${order[position].productname}",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: style1Font11Weight500,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                    ],
                  ),
                ),
              );
            }):Text("empty "));
  }
}
