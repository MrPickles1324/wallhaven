import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallhaven/data/wallhaven_repository/image_model.dart';
import 'package:wallhaven/io/image_saver.dart';
import 'package:wallhaven/settings_repository.dart';

part 'image_state.dart';

class ImagePageCubit extends Cubit<ImagePageState> {
  ImagePageCubit({required ImageModel image, required String saveLocation})
      : super(ImagePageState(image: image, saveLocation: saveLocation));

  Future<void> download() async {
    var result = await saveImage(state.image.path, state.saveLocation);
    if (result) {
      emit(state.copyWith(saveStatus: SaveStatus.success));
    } else {
      emit(state.copyWith(saveStatus: SaveStatus.failure));
    }
  }
}
