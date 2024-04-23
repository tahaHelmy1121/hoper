part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderSuccess extends OrderState {}
class Orderfalure extends OrderState {}

