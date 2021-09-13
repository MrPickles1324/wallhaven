import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallhaven/data/wallhaven_repository/wallhaven_repository.dart';
import 'package:wallhaven/ui/pages/home/bloc/home_bloc.dart';
import 'package:wallhaven/ui/pages/home/connectivity/connectivity_cubit.dart';
import 'package:wallhaven/ui/pages/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(context.read<WallhavenRepository>())
            ..add(ReachedEndOfList()),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(),
        ),
      ],
      child: const HomeView(),
    );
  }
}
