import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ImageOnline extends StatelessWidget {
  const ImageOnline({Key? key, required this.url, this.width, this.height, this.fit})
      : super(key: key);

  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      fit: fit,
      placeholder: (context, url) => Center(
        child: Shimmer.fromColors(
          baseColor: Colors.lightBlueAccent,
          highlightColor: Colors.lightBlue,
          child: Container(
            height: 220,
            alignment: Alignment.center,
            child: const SizedBox(
              width: 0,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
      ),
    );
  }
}
