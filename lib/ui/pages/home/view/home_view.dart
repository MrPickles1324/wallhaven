import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:wallhaven/data/wallhaven_repository/image_model.dart';
import 'package:wallhaven/data/wallhaven_repository/model.dart';
import 'package:wallhaven/ui/pages/home/bloc/home_bloc.dart';
import 'package:wallhaven/ui/pages/home/connectivity/connectivity_cubit.dart';
import 'package:wallhaven/ui/widgets/grid_image_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();
  SearchParameters searchParameters = SearchParameters.defaultValues();

  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = context.read<HomeBloc>();
    _scrollController.addListener(_onScroll);
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
            body: _imagesList(state.images),
          );
        },
      ),
    );
  }

  Widget _loading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _imagesList(List<ImageModel> images) {
    debugPrint("images: ${images.length}");
    return LazyLoadScrollView(
      onEndOfPage: () => _homeBloc.add(ReachedEndOfList()),
      child: StaggeredGridView.countBuilder(
        // controller: _scrollController,
        itemCount: images.length,
        crossAxisCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: GridImageCard(image: images[index]),
        ),
        staggeredTileBuilder: (index) =>
            StaggeredTile.fit(MediaQuery.of(context).size.width > 700 ? 1 : 2),
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
        return "";
    }
  }

  void _onScroll() {
    if (_isBottom) {
      _homeBloc.add(ReachedEndOfList());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }
}