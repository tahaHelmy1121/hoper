import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_state.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/shared_widget/drew_background_color.dart';
import 'package:hoper/shared_widget/statusapp/loadingScreen.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared_widget/app_style.dart';
import '../home/widget/search.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<HomeCubit>(context).getSearchData();
    //  BlocProvider.of<HomeCubit>(context).onSearchItems();
    super.setState(fn);
  }

  void initState() {
    BlocProvider.of<HomeCubit>(context).getSearchData();
    //  BlocProvider.of<HomeCubit>(context).onSearchItems();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var search = BlocProvider
        .of<HomeCubit>(context)
        .search;
    return BlocProvider(
      create: (context) => HomeCubit(HomeState.success()),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          state.when(
              initial: () => HomeState.initial,
              loading: () => LoadingScreen(),
              success: () => BodySearch(search: search),
              error: (e) => LoadingScreen());
        },
        child: Scaffold(
          body: SingleChildScrollView(child: BodySearch(search: search)),
        ),
      ),
    );
  }

  Widget BodySearch({search}) {
    return Form(
      key: context
          .read<HomeCubit>()
          .globalKey,
      child: Column(
        children: [
          Stack(
            children: [
              drewBackGroundColors(),
              Container(
                margin: EdgeInsets.only(top: 30.sp, right: 15.sp),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: Image.asset("assets/images/back.png",
                                  width: 45.w, height: 60.h, color: Colors.black26,),),
                          drewCustomSearchField(
                              context: context,
                              onTab: (val) {
                                setState(() {
                                  context.read<HomeCubit>().checkSearch(val);
                                  context.read<HomeCubit>().getSearchData();
                                });
                              },
                              onTabSub: (s) {
                                if (context
                                    .read<HomeCubit>()
                                    .globalKey
                                    .currentState!
                                    .validate()) {
                                  return context.read<HomeCubit>()
                                      .onSearchItems();
                                }
                              },
                              search: context
                                  .watch<HomeCubit>()
                                  .searchController),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 450.w,
                        height: 650.h,
                        child: search.isEmpty
                            ? Column(
                          children: [
                            Center(
                                child: Image.asset(
                                    "assets/images/Alert.png")),
                            SizedBox(
                              height: 14,
                            ),
                          ],
                        )
                            : GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 5,
                              mainAxisExtent: 300,
                            ),
                            itemCount: search.length,
                            itemBuilder: (context, position) {
                              return Container(
                                margin: EdgeInsets.all(12),
                                width: 250.w,
                                height: 500.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: HexColor("#F1FFF6"),
                                  //   border: Border.all(color: Colors.black)),
                                ),
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
                                            imageUrl:
                                            search[position].image,
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
                                                CrossAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      child: Center(
                                                          child: Icon(Icons
                                                              .favorite_border)),
                                                      width: 25.w,
                                                      height: 25.h,
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            50),
                                                        color: HexColor(
                                                            "#49B673"),
                                                      ),
                                                    ),
                                                  ),
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
                                                              "${search[position]
                                                                  .price}جنية",
                                                              style: GoogleFonts
                                                                  .tajawal(
                                                                  fontSize: 12,
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
                                    Text(
                                      "${search[position].name}",
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: style1Font11Weight500,
                                    ),
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    search[position].region == null
                                        ? Text(
                                      "لم يتم اختيار العنوان",
                                      style: style1Font11Weight500
                                          .copyWith(
                                          color: Colors.green,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                        : Text(
                                      "${search[position].region.toString()}",
                                      textAlign: TextAlign.end,
                                      style: style1Font11Weight500,
                                    )
                                  ],
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
