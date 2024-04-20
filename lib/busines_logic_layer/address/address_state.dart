part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressSucess extends AddressState {}
class AddressFalure extends AddressState {}

