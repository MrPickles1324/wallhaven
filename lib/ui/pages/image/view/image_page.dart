import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallhaven/data/wallhaven_repository/image_model.dart';
import 'package:wallhaven/settings_repository.dart';
import 'package:wallhaven/ui/pages/image/cubit/image_cubit.dart';
import 'package:wallhaven/ui/pages/image/view/image_view.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({required this.image, Key? key}) : super(key: key);

  final ImageModel image;

  static Route route({
    required ImageModel image,
  }) =>
      MaterialPageRoute(
        builder: (context) => ImagePage(image: image),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePageCubit(
        image: image,
        saveLocation: context.read<SettingsRepository>().downloadDir,
      ),
      child: const ImageView(),
    );
  }
}
