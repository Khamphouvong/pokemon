import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/constants/image_path.dart';

class ImageWidget extends StatelessWidget {
  final int index;
  const ImageWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '${ImagePath.imageUrl}${index + 1}.png',
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
