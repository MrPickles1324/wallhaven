part of 'image_cubit.dart';

enum SaveStatus {
  success,
  failure,
}

class ImagePageState {
  ImagePageState({
    required this.image,
    required this.saveLocation,
    this.saveStatus = SaveStatus.success,
  });
  final WallhavenImage image;
  final SaveStatus saveStatus;
  final String saveLocation;

  ImagePageState copyWith({
    WallhavenImage? image,
    SaveStatus? saveStatus,
    String? saveLocation,
  }) {
    return ImagePageState(
      image: image ?? this.image,
      saveStatus: saveStatus ?? this.saveStatus,
      saveLocation: saveLocation ?? this.saveLocation,
    );
  }
}
