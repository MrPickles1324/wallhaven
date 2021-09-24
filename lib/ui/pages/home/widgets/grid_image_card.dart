import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallhaven/data/wallhaven_repository/image_model.dart';
import 'package:wallhaven/ui/pages/image/view/image_page.dart';

class GridImageCard extends StatelessWidget {
  const GridImageCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final WallhavenImage image;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, action) => ImagePage(
        image: image,
      ),
      closedBuilder: (context, action) => InkWell(
        onTap: action,
        child: CachedNetworkImage(
          imageUrl: image.thumbs.original,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
