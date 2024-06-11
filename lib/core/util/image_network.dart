// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:yolcu360_kahve/core/res/assets.gen.dart';
import 'package:yolcu360_kahve/core/res/dimens.dart';

class ImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final AssetImage? placeholder;
  const ImageNetwork({
    super.key,
    this.imageUrl,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    imageBuilder(c, p) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.m),
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: p,
              fit: BoxFit.cover,
            ),
          ),
        );
    return imageUrl == null
        ? imageBuilder.call(
            context, placeholder ?? AppAssets.images.phYolcu360.provider())
        : CachedNetworkImage(
            imageUrl: imageUrl!,
            imageBuilder: imageBuilder,
            fadeOutDuration: Duration.zero,
            fadeInDuration: Duration.zero,
            placeholder: (context, url) => imageBuilder.call(
              context,
              placeholder ?? AppAssets.images.phYolcu360.provider(),
            ),
            errorWidget: (context, url, error) => imageBuilder.call(
              context,
              placeholder ?? AppAssets.images.phYolcu360.provider(),
            ),
          );
  }
}
