import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallhaven/data/wallhaven_repository/wallhaven_repository.dart';
import 'package:wallhaven/settings_repository.dart';
import 'package:wallhaven/ui/pages/home/view/home_page.dart';

class WallhavenApp extends StatelessWidget {
  const WallhavenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalKey<NavigatorState>(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MultiRepositoryProvider(
        providers: [
          _setUpSettingsRepository(),
          _setUpWallhavenRepository(),
        ],
        child: child!,
      ),
      home: const HomePage(),
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
