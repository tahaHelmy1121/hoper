import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/busines_logic_layer/pages/pages_cubit.dart';
import 'package:hoper/shared_widget/statusapp/loadingScreen.dart';
import 'package:shimmer/shimmer.dart';

import '../shared_widget/app_style.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
@override
  void initState() {
  BlocProvider.of<PagesCubit>(context).getAbout();
    super.initState();
  }
  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<PagesCubit>(context).getAbout();
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    var pages = BlocProvider.of<PagesCubit>(context).pages;
    BlocProvider.of<PagesCubit>(context).getAbout();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body:pages.isEmpty?LoadingScreen(): BlocBuilder<PagesCubit, PagesState>(
  builder: (context, state) {
    return drewPagesBody(pages: pages);
  },
));
  }
  Widget drewPagesBody({pages}){
  return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10.sp),
                      child: Center(
                          child: Column(
                            children: [
                              Text(
                                "${pages[1].name1}",
                                style: style1Font25Weight500,
                              ),
                              SizedBox(height: 12.h,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  width: 140.w,
                                  height: 100.h,
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.image),
                                  placeholder: (context, url) => Shimmer(
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.grey,
                                          Colors.white
                                        ]),
                                    child: Container(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  imageUrl: pages
                                  [1].image
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 12.h,),
                              Text(
                                "${pages[1].describe}",
                                textAlign: TextAlign.center,
                                style: style1Font14Weight400,
                              ),
                            ],
                          )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
