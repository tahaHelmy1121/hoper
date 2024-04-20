

         import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../busines_logic_layer/cart/cart_cubit.dart';

Widget drewCartImage({cart , index,required BuildContext context}){

  return    ClipRRect(
    borderRadius: BorderRadius.circular(17),
    child: Stack(
      children: [
        CachedNetworkImage(
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
          imageUrl: cart
              .products![index].productImage
              .toString(),
          fit: BoxFit.cover,
        ),
        InkWell(
            onTap: () {
              context
                  .read<CartCubit>()
                  .getRemoveToCart(
                  context: context,
                  cartItemId: cart.products![index]
                      .id,
                  index: index);
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ],
    ),
  );


}