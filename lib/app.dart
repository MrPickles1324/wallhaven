import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallhaven/app_cubit/app_cubit.dart';
import 'package:wallhaven/data/wallhaven_repository/wallhaven_repository.dart';
import 'package:wallhaven/settings_repository.dart';
import 'package:wallhaven/ui/pages/home/view/home_page.dart';
import 'package:wallhaven/ui/pages/image/view/image_page.dart';

class WallhavenApp extends StatelessWidget {
  const WallhavenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  AppView({Key? key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MultiRepositoryProvider(
        providers: [
          _setUpSettingsRepository(),
          _setUpWallhavenRepository(),
        ],
        child: BlocListener<AppCubit, AppState>(
          listener: (context, state) {
            if (state is Home) {
              _navigator.pushAndRemoveUntil(HomePage.route, (route) => false);
            } else if (state is ImageOpened) {
              _navigator.push(ImagePage.route(image: state.image));
            } else if (state is SettingsOpened) {
              //TODO: implement settings opened
            }
          },
          child: child,
        ),
      ),
      onGenerateRoute: (settings) => HomePage.route,
    );
  }

  RepositoryProvider<WallhavenRepository> _setUpWallhavenRepository() {
    return RepositoryProvider(
      create: (context) => WallhavenRepository(),
    );
  }

  RepositoryProvider<SettingsRepository> _setUpSettingsRepository() {
    return RepositoryProvider(
      create: (context) => SettingsRepository.defaults,
    );
  }
}
