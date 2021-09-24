import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallhaven/ui/pages/image/cubit/image_cubit.dart';

class ImageViewMobile extends StatelessWidget {
  const ImageViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImagePageCubit, ImagePageState>(
      listener: (context, state) {
        switch (state.saveStatus) {
          case SaveStatus.success:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Image Saved at: ${state.saveLocation}"),
              ),
            );
            break;
          case SaveStatus.failure:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Failed to Download image"),
              ),
            );
            break;
        }
      },
      child: BlocBuilder<ImagePageCubit, ImagePageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView(
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          height: constraints.maxHeight * 0.9,
                          imageUrl: state.image.path,
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.topCenter,
                          errorWidget: (context, url, error) =>
                              const Text("Error loading image"),
                          progressIndicatorBuilder: (context, url, progress) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                LinearProgressIndicator(
                                  value: progress.progress,
                                  color: Colors.pink[700],
                                ),
                                CachedNetworkImage(
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                  imageUrl: state.image.thumbs.original,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () =>
                                context.read<ImagePageCubit>().download(),
                            child: const Text("Download"),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
