import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../shared_widget/app_style.dart';
import '../../../../shared_widget/statusapp/OffLineScreen.dart';
import '../../../../shared_widget/statusapp/loadingScreen.dart';
import '../drew_logo_and_drawer/drew_logo_and_drwer.dart';

class DrewSubCategory extends StatefulWidget {
 int id ;
 String name ;
   DrewSubCategory({super.key, required this.id,required this.name});

  @override
  State<DrewSubCategory> createState() => _DrewSubCategoryState();
}

class _DrewSubCategoryState extends State<DrewSubCategory> {
@override
  void setState(VoidCallback fn) {
  BlocProvider.of<HomeCubit>(context).emitSubCategories(id:widget.id);
    super.setState(fn);
  }
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).emitSubCategories(id:widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var sub = context.watch<HomeCubit>().subCategory;
  return  Scaffold(
      body: sub.isNotEmpty
          ? RefreshIndicator(
        onRefresh: (){
          return  context.read<HomeCubit>().emitSubCategories();
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
                               widget.name,
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
                            child: drewSubCategory(sub: sub)),
                      ),
                    )
                ],
              ),
            ),
          )
          :LoadingScreen(),
    );
  }
  Widget drewSubCategory({sub}){
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 8,
          mainAxisExtent: 280.h,
        ),
        itemCount: sub.length,
        itemBuilder: (context, position) {
          BlocProvider.of<HomeCubit>(context).emitSubCategories(id:widget.id);
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
                        imageUrl: sub[position]
                            .image,
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
                                          "${sub[position].price}جنية",
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
                Text("${sub[position].name}",
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
                        "${sub[position].name}",
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
        });
  },
);
  }
}
