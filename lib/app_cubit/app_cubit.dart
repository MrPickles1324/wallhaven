import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallhaven/data/wallhaven_repository/image_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  void returnToHome() => emit(Home());

  void openSettings() => emit(SettingsOpened());

  void openImage(ImageModel image) => emit(ImageOpened(image: image));
}
