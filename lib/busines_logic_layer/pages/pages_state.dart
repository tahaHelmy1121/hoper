part of 'pages_cubit.dart';

@immutable
abstract class PagesState {}

class PagesInitial extends PagesState {}
class pagesSuccess extends PagesState {}
class pagesFalure extends PagesState {}
class pagesLoading extends PagesState {}