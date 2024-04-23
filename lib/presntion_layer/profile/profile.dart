import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoper/busines_logic_layer/order/order_cubit.dart';
import 'package:hoper/busines_logic_layer/profile/profile_cubit.dart';
import 'package:hoper/busines_logic_layer/profile/profile_state.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/profile/edit_profile.dart';
import 'package:hoper/shared_widget/drawer.dart';
import 'package:hoper/shared_widget/statusapp/loadingScreen.dart';

import '../../busines_logic_layer/home/home_cubit.dart';
import '../../shared_widget/app_style.dart';
import '../../shared_widget/drew_background_color.dart';
import '../home/widget/drew_logo_and_drawer/drew_logo_and_drwer.dart';
import '../home/widget/drew_product_home/drew_product_home.dart';
import 'drew_all_orders/drew_all_order.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

late TabController tabController;

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<ProfileCubit>(context).getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var profile = context.watch<ProfileCubit>().profileModel;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        endDrawer: CustomDrawer(),
        key: _scaffoldKey,
        body: profile == null
            ? drewNotProfileEmpty()
            : SafeArea(
                child: SingleChildScrollView(
                child: Stack(
                  children: [
                    drewBackGroundColors(),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(25),
                            child:
                            Image.asset("assets/images/Notification.png")),
                        profile.firstName==null?CircularProgressIndicator(color: Colors.black26,):       Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "${context.watch<ProfileCubit>().profileModel.firstName}",
                              style: style1Font20Weight400.copyWith(
                                  letterSpacing: 2,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            )),
                        profile.firstName==null?CircularProgressIndicator(color: Colors.black26,):           Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "${context.watch<ProfileCubit>().profileModel.userEmail}",
                              style: style1Font20Weight400.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            )),
                        profile.firstName==null?CircularProgressIndicator(color: Colors.black26,):         Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "${context.watch<ProfileCubit>().profileModel.mobile}",
                              style: style1Font20Weight400.copyWith(
                                  letterSpacing: 1,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    drewDrawerAndLogo(
                                        scaffoldKey: _scaffoldKey),
                                    Text("حسابى",
                                        style: style1Font20Weight400.copyWith(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 100.w,
                                                height: 100.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                //  context.read<OrderCubit>().emitOrders();
                                                 context.push(EditProfileView(),context);
                                                },
                                                child: Image.asset(
                                                    "assets/images/Edit.png"),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 327.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.green, width: 1),
                                    color: Colors.white,
                                  ),
                                  child: TabBar(
                                    indicatorWeight: 2,
                                    unselectedLabelColor: Colors.black,
                                    labelColor: Colors.white,
                                    labelStyle: GoogleFonts.tajawal(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                    controller: tabController,
                                    indicator: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.green,
                                            spreadRadius: 0.1,
                                            blurRadius: 5.9)
                                      ],
                                      color: Colors.green,
                                    ),
                                    tabs: <Widget>[
                                      Tab(
                                        text: "العقارات التى تم بيعها",
                                      ),
                                      Tab(
                                        text: "عقاراتى",
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 390.w,
                                  height: 420.h,
                                  child: TabBarView(
                                    controller: tabController,
                                    children: [
                                      DrewAllOrders(),
                                      DrewHomeProduct(
                                        productsData: context
                                            .watch<HomeCubit>()
                                            .productsModel,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              )));
  }

  Widget drewNotProfileEmpty() {
    return Center(child: Text("الرجاء التحقق من تسجيل الدخول"));
  }
}
