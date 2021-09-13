import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallhaven/app_cubit/app_cubit.dart';

import 'package:wallhaven/data/wallhaven_repository/image_model.dart';
import 'package:wallhaven/ui/pages/image/view/image_page.dart';
import 'package:wallhaven/ui/pages/image/view/image_view.dart';
import 'package:animations/animations.dart';

class GridImageCard extends StatelessWidget {
  const GridImageCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, action) => ImagePage(
        image: image,
      ),
      closedBuilder: (context, action) => InkWell(
        onTap: action,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: getBorderColor(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: image.thumbs.original,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //TODO: change when adding theming
  Color getBorderColor() {
    if (image.purity == "sketchy") return Colors.yellow;
    if (image.purity == "nsfw") return Colors.red;
    return Colors.transparent;
  }
}
