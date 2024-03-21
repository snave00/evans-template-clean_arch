import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../progress/custom_circular_progress.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const CustomCircularProgress(
        progressSize: ProgressSize.small,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
