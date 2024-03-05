import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widgets/simmer/simmer_loader.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class AppRoundedImage extends StatelessWidget {
  const AppRoundedImage({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.borderRadius = AppSizes.md,
    required this.imageUrl,
    this.border,
    this.backgroundColor,
    this.color,
    this.fit,
    this.isNetworkImage = false,
    this.onPress,
    this.applyImageRadius = true,
  });

  final double? height, width;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final String imageUrl;
  final BoxBorder? border;
  final Color? backgroundColor, color;
  final BoxFit? fit;
  final bool isNetworkImage;
  final bool applyImageRadius;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: color,
                  imageUrl: imageUrl ,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const AppShimmerLoader(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  color: color,
                  fit: fit,
                  image: AssetImage(imageUrl),
                ),
        ),
      ),
    );
  }
}
