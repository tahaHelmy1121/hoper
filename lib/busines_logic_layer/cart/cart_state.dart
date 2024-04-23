import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState<T> with _$CartState<T> {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = Loading;
  const factory CartState.success() = Success<T>;
  const factory CartState.error({required String error}) = Error;
}
