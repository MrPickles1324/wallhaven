part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class Home extends AppState {}

class SettingsOpened extends AppState {}

class ImageOpened extends AppState {
  ImageOpened({required this.image});
  final ImageModel image;
}
