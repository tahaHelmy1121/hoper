import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoper/busines_logic_layer/home/home_cubit.dart';
import 'package:hoper/busines_logic_layer/home/home_state.dart';
import 'package:hoper/helper/extenstion.dart';
import 'package:hoper/presntion_layer/home/widget/drew_sub_categories/drew_sub_categories.dart';

import '../../../../data_layer/model/categories/categories_model.dart';
import '../../../../shared_widget/app_style.dart';

class DrewAnyCategories extends StatefulWidget {
  List<CategoriesModel> categoriesModel = [];

  DrewAnyCategories({super.key, required this.categoriesModel});

  @override
  State<DrewAnyCategories> createState() => _DrewAnyCategoriesState();
}

class _DrewAnyCategoriesState extends State<DrewAnyCategories> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {},
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 5),
            width: 350.w,
            height: 60,
            child: widget.categoriesModel.isEmpty
                ? CircularProgressIndicator(
                    color: Colors.black,
                  )
                : BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.categoriesModel.length,
                          itemBuilder: (context, index) {

                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<HomeCubit>()
                                        .changeCurrentIndex(index: index);
                                    context.read<HomeCubit>().emitSubCategories(
                                      id: widget.categoriesModel[index].id);
                                    context.push(DrewSubCategory(id: widget.categoriesModel[index].id, name:widget.categoriesModel[index].name,), context);

                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: context
                                                    .watch<HomeCubit>()
                                                    .tappedIndex ==
                                                index
                                            ? Colors.green
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                        child: Text(
                                      widget.categoriesModel[index].name
                                          .toString(),
                                      style: style1Font14Weight400.copyWith(
                                          color: Colors.black),
                                    )),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
