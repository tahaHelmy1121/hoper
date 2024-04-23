import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_state.freezed.dart';

@freezed
class FavouriteState<T> with _$FavouriteState<T> {
  const factory FavouriteState.initial() = _Initial;

  const factory FavouriteState.loading() = Loading;
  const factory FavouriteState.success() = Success<T>;
  const factory FavouriteState.error({required String error}) = Error;
}
