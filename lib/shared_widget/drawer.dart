import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/chat/chat_view.dart';
import 'package:hoper/presntion_layer/home/home_view.dart';

import '../busines_logic_layer/home/home_cubit.dart';
import '../presntion_layer/estate/get_all_address.dart';
import '../presntion_layer/pages.dart';
import 'app_style.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

///note ==>        edit drawer 1= create drawer model  // 2 = create drawer dynamic tab
///

class _CustomDrawerState extends State<CustomDrawer> {
  late int tappedIndex;

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(4.sp),
                child: Image.asset(
                  "assets/images/logo 1.jpg",
                  fit: BoxFit.cover,
                )),
            Container(
              padding: EdgeInsets.all(1.sp),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: ListTile(
                      iconColor: Colors.green,
                      selectedColor: Colors.green,
                      trailing: Icon(Icons.home_outlined),
                      title: Text(
                        'الرئيسية',
                        textAlign: TextAlign.end,
                        style:
                            style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      onTap: () {
                        /// Close Navigation drawer before
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListTile(
                      focusColor: Colors.green,
                      iconColor: Colors.green,
                      //    selectedTileColor: Colors.green.shade200,
                      selectedColor: Colors.green,
                      selected: true,
                      trailing: Image.asset(
                          "assets/images/tabler_device-tv-old (1).png"),
                      title: Text(
                        'تصفح الاعلانات',
                        textAlign: TextAlign.end,
                        style:
                            style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      onTap: () {
                    //    / Close Navigation drawer before
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddressView()),
                         );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        'العروض المميزه',
                        textAlign: TextAlign.end,
                        style:
                            style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      trailing: Image.asset("assets/images/Group.png"),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        'حجوزاتى',
                        textAlign: TextAlign.end,
                        style:
                            style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      trailing: Image.asset("assets/images/Group (1).png"),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        'الاعلانات المفضلة',
                        textAlign: TextAlign.end,
                        style:
                            style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      trailing: Image.asset("assets/images/Group (2).png"),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        'تواصل معنا',
                        textAlign: TextAlign.end,
                        style:
                            style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      trailing: Image.asset("assets/images/Call.png"),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        ' ماذا عنا',
                        textAlign: TextAlign.end,
                        style:
                        style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      trailing: Icon(Icons.add_circle_outline),
                      onTap: () {
                        context.push(AboutView(), context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        'الدعم',
                        textAlign: TextAlign.end,
                        style:
                        style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      trailing:
                      Image.asset("assets/images/tabler_brand-hipchat.png"),
                      onTap: () {
                        context.push(ChatView(), context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.sp),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        'اللغة',
                        textAlign: TextAlign.end,
                        style:
                        style1Font20Weight400.copyWith(color: Colors.black),
                      ),
                      trailing:
                     InkWell(
                         onTap: (){

                         },
                         child: FaIcon(FontAwesomeIcons.language)),
                      onTap: () {
                        context.push(drewListLangUage(),context);
                      },
                    ),
                  ),
                  Container(
        
                      child: Image.asset(
        
                    "assets/images/login.png",
                        width: 250.w,
                        height: 125.h,
                        fit: BoxFit.contain,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drewListLangUage() {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("اللغات",style:style1Font20Weight400,),),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: InkWell(
                  onTap: (){
                    BlocProvider.of<HomeCubit>(context)
                        .changeLang("1");
                  },
                  child: FaIcon(FontAwesomeIcons.language)),
              title: Text('arabic'),
            ),
            ListTile(
              leading: InkWell(
                  onTap: (){
                    BlocProvider.of<HomeCubit>(context)
                        .changeLang("2");
                  },
                  child: FaIcon(FontAwesomeIcons.language)),
              title: Text('Englisg'),
            ),
          ],
        ),
      ),
    );
  }

}
