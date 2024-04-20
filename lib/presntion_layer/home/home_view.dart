import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_state.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/home/widget/categories/drew_categories_view.dart';
import 'package:hoper/presntion_layer/home/widget/drew_logo_and_drawer/drew_logo_and_drwer.dart';
import 'package:hoper/presntion_layer/home/widget/drew_product_home/drew_product_home.dart';
import 'package:hoper/presntion_layer/home/widget/drew_regions/drew_regions.dart';
import 'package:hoper/presntion_layer/home/widget/drew_slider/drewslider.dart';
import 'package:hoper/presntion_layer/home/widget/search.dart';
import 'package:hoper/presntion_layer/search/search.dart';
import '../../busines_logic_layer/pages/pages_cubit.dart';
import '../../shared_widget/drawer.dart';
import '../../shared_widget/drew_background_color.dart';
import '../../shared_widget/statusapp/OffLineScreen.dart';
import '../../shared_widget/statusapp/loadingScreen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    setState(() {
      BlocProvider.of<HomeCubit>(context).emitSlider();
      BlocProvider.of<HomeCubit>(context).emitCategories();
      BlocProvider.of<PagesCubit>(context).getAbout();
     BlocProvider.of<HomeCubit>(context).emitAnyProducts();
      BlocProvider.of<HomeCubit>(context).getSearchData();

    //  BlocProvider.of<HomeCubit>(context).getSubProductCategory(context: context);

    }
    );

    return Scaffold(
      endDrawer: CustomDrawer(),
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  initial:
                      () => Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ));
                  () => LoadingScreen();
                  //  :
                  success:
                  () => drewHomeBody(
                      categorie: context.watch<HomeCubit>().categoriesModel,
                      slider: context.watch<HomeCubit>().sliderModel);
                  error:
                  (e) => const OffLineScreen();
                  return drewHomeBody(
                      categorie: context.watch<HomeCubit>().categoriesModel,
                      slider: context.watch<HomeCubit>().sliderModel);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drewHomeBody({categorie, slider}) {
    return Container(
      child: Row(
        children: [
          Stack(
            children: [
              drewBackGroundColors(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                         Image.asset("assets/images/Notification.png"),
                           SizedBox(width: 20.sp,),
                           InkWell(
                               onTap: (){
                                 context.push(SearchView(), context);
                               },
                               child: Icon(Icons.search_outlined,size: 20.sp,)),
                         ],
                       ),
                          SizedBox(width: 35.w,),
                          Container(
                            child: drewDrawerAndLogo(scaffoldKey: _scaffoldKey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "مرحبا بك فى هوبر!  دعنا نتصفح المشاريع الجديدة لدينا",
                                textAlign: TextAlign.end,
                                style: GoogleFonts.tajawal(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                           SizedBox(

                               child: DrewAnyCategories(categoriesModel:categorie,)),
                              drewSlider(slider: slider),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 180.sp),
                                    child: Text(
                                      "العروض",
                                      style: GoogleFonts.tajawal(
                                          letterSpacing: 2,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              drewRegions(categorie: categorie),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "المزيد",
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                      fontSize: 14.sp,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                width: 100.w,
                              ),
                              InkWell(
                                onTap: () {
                                },
                                child: Text(
                                  "المنتجات",
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.tajawal(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: 370.w,
                              height: 380.h,
                              child: DrewHomeProduct(
                                productsData:
                                    context.watch<HomeCubit>().productsModel,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "المزيد",
                                textAlign: TextAlign.end,
                                style: GoogleFonts.tajawal(
                                    fontSize: 14.sp,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 100.w,
                              ),
                              Text(
                                "العروض المميزة",
                                textAlign: TextAlign.end,
                                style: GoogleFonts.tajawal(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
