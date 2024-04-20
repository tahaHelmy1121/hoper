import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
  void push(Widget widget,BuildContext context) {
    //  Navigator.canPop(context);
    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (context, animation, child) {
        return FadeTransition(
          opacity: animation,
          child:  widget,
        );
      }),
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}



extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenwidth => MediaQuery.of(this).size.width;
}
