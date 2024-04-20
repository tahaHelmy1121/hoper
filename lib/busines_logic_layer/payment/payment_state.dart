part of 'payment_cubit.dart';

@immutable
sealed  class PaymentState {}

 class PaymentInitial extends PaymentState {}

  class PaymentSccsess extends PaymentState {}

  class Paymentloading extends PaymentState {}

    class PaymentFaluare extends PaymentState {
  String error ;

  PaymentFaluare({required this.error});
}
