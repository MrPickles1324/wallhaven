import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:wallhaven/data/wallhaven_repository/search_parameters.dart';
import 'package:wallhaven/ui/pages/home/bloc/home_bloc.dart';
import 'package:wallhaven/ui/pages/home/connectivity/connectivity_cubit.dart';
import 'package:wallhaven/ui/pages/home/widgets/grid_image_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SearchParameters searchParameters = SearchParameters.defaultValues();

  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is InternetAvailable) {
          _homeBloc.add(GotConnection());
        } else if (state is InternetUnvalable) {
          _homeBloc.add(LostConnection());
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_getAppBarText(state)),
            ),
            body: _imagesList(state),
          );
        },
      ),
    );
  }

  Widget _imagesList(HomeState state) {
    return LazyLoadScrollView(
      onEndOfPage: () => _homeBloc.add(ReachedEndOfList()),
      child: StaggeredGridView.countBuilder(
        // controller: _scrollController,
        itemCount: state.images.length,
        crossAxisCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: GridImageCard(image: state.images[index]),
        ),
        staggeredTileBuilder: (index) => StaggeredTile.fit(
          MediaQuery.of(context).size.width > 800 ? 1 : 2,
        ),
      ),
    );
  }

  String _getAppBarText(HomeState state) {
    switch (state.status) {
      case Status.waitingConnection:
        return "Waiting for Internet";
      case Status.loading:
        return "Loading...";
      default:
        return "Wallhaven";
    }
  }
}
