part of 'home_bloc.dart';

enum Status {
  waitingConnection,
  initial,
  loading,
  success,
  failure,
}

class HomeState {
  HomeState(
    this.searchParameters, {
    this.status = Status.waitingConnection,
    this.images = const <ImageModel>[],
    this.hasReachedMax = false,
  });

  final Status status;
  final List<ImageModel> images;
  final bool hasReachedMax;
  final SearchParameters searchParameters;

  HomeState copyWith({
    Status? status,
    List<ImageModel>? images,
    bool? hasReachedMax,
    SearchParameters? searchParameters,
  }) {
    return HomeState(
      searchParameters ?? this.searchParameters,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      images: images ?? this.images,
    );
  }
}
