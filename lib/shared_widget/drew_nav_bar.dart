import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_state.dart';
import 'package:hoper/busines_logic_layer/profile/profile_cubit.dart';
import 'package:hoper/busines_logic_layer/profile/profile_state.dart';
import 'package:hoper/helper/app_locale.dart';
import 'package:hoper/helper/app_strings.dart';
import 'package:hoper/presntion_layer/cart/cart_view.dart';
import 'package:hoper/presntion_layer/payment.dart';
import 'package:hoper/presntion_layer/favourite/favouriteview.dart';
import 'package:hoper/presntion_layer/home/home_view.dart';
import 'package:hoper/presntion_layer/profile/profile.dart';
import 'package:hoper/shared_widget/statusapp/OffLineScreen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  var myCurrentIndex = 0;
  List pages = [
    const HomeView(),
    const CartView(),
    FavouriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  HomeCubit(HomeState.initial())..getCachedLang()),
          BlocProvider(
              create: (context) => ProfileCubit(ProfileState.initial()))
        ],
        child: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
              if (snapshot.hasData) {
                ConnectivityResult? result = snapshot.data;
                if (result == ConnectivityResult.wifi) {
                  return drewAppBody();
                } else if (result == ConnectivityResult.mobile) {
                  return drewAppBody();
                } else {
                  return OffLineScreen();
                }
              }
              return drewAppBody();
            }));
  }

  Widget drewAppBody() {
    return Scaffold(
      body: pages[myCurrentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
            offset: const Offset(8, 20),
          )
        ]),
        margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BottomNavigationBar(
            backgroundColor: HexColor("#4FCC7F"),
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            //  backgroundColor: Colors.green,

            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: HexColor("#4FCC7F"),
                  icon: const Icon(
                    Icons.home_max_sharp,
                    color: Colors.black,
                  ),
                  //AppStrings.welcomeToChefApp.tr(context)
                  label:"home"),
              BottomNavigationBarItem(
                  backgroundColor: HexColor("#4FCC7F"),
                  icon: Icon(Icons.shopping_cart_rounded),
                  label: "cart"),
              BottomNavigationBarItem(
                  backgroundColor: HexColor("#4FCC7F"),
                  icon: Icon(Icons.favorite_border),
                  label: "favorite"),
              BottomNavigationBarItem(
                  backgroundColor: HexColor("#4FCC7F"),
                  icon: Icon(Icons.account_circle_sharp),
                  label: "profile"),
            ],
          ),
        ),
      ),
    );
  }
}
