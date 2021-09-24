part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ReachedEndOfList extends HomeEvent {}

class LostConnection extends HomeEvent {}

class GotConnection extends HomeEvent {}

class SearchParametersChanged extends HomeEvent {
  SearchParametersChanged({required this.searchParameters});
  final SearchParameters searchParameters;
}
