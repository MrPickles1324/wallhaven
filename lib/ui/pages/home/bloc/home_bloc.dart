import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallhaven/data/wallhaven_repository/image_model.dart';
import 'package:wallhaven/data/wallhaven_repository/search_parameters.dart';
import 'package:wallhaven/data/wallhaven_repository/wallhaven_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._wallhavenRepository)
      : super(HomeState(SearchParameters.defaultValues()));

  final WallhavenRepository _wallhavenRepository;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is ReachedEndOfList) {
      yield* _mapReachedEndOfListToState(state);
    } else if (event is GotConnection) {
      yield _mapGotConnectionState(state);
    } else if (event is LostConnection) {
      yield _mapLostConnectionToState(state);
    } else if (event is SearchParametersChanged) {
      yield* _mapSearchParametersChangedtoState(event, state);
    }
  }

  Stream<HomeState> _mapReachedEndOfListToState(HomeState state) async* {
    if (state.hasReachedMax) yield state;
    yield state.copyWith(status: Status.loading);
    try {
      if (state.status == Status.initial) {
        final images =
            await _wallhavenRepository.fetchImages(state.searchParameters);
        yield images.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: Status.success, images: images, hasReachedMax: false);
      }
      var currentPage = state.searchParameters.page;
      var params = state.searchParameters.copyWith(page: currentPage + 1);
      final images = await _wallhavenRepository
          .fetchImages(state.searchParameters.copyWith(page: params.page));
      yield images.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              searchParameters: params,
              status: Status.success,
              images: List.of(state.images)..addAll(images),
              hasReachedMax: false);
    } on Exception {
      yield state.copyWith(status: Status.failure);
    }
  }

  HomeState _mapGotConnectionState(HomeState state) {
    if (state.images.isEmpty) return state.copyWith(status: Status.initial);
    return state.copyWith(status: Status.success);
  }

  HomeState _mapLostConnectionToState(HomeState state) {
    return state.copyWith(status: Status.waitingConnection);
  }

  Stream<HomeState> _mapSearchParametersChangedtoState(
    SearchParametersChanged event,
    HomeState state,
  ) async* {
    yield state.copyWith(
      searchParameters: event.searchParameters,
      hasReachedMax: false,
      images: [],
      status: Status.initial,
    );
    add(ReachedEndOfList());
  }
}
