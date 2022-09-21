import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'full_screen_page.dart';


enum ImageType { asset, network }

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.path,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
    this.imageType = ImageType.network,
    this.viewFullImageWhenClick = false,
    this.border,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final ImageType imageType;
  final String path;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final bool viewFullImageWhenClick;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: viewFullImageWhenClick
            ? () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    // barrierColor: dark ? Colors.black : Colors.white,
                    pageBuilder: (BuildContext context, _, __) {
                      return FullScreenPage(
                        dark: true,
                        url: path,
                      );
                    },
                  ),
                );
              }
            : null,
        child: getImageByType);
  }

  Widget get getImageByType {
    switch (imageType) {
      case ImageType.asset:
        return ExtendedImage.asset(
          path,
          color: color,
          height: height,
          width: width,
          borderRadius: borderRadius,
          fit: fit,
          border: border,
        );
      case ImageType.network:
        return ExtendedImage.network(
          path,
          color: color,
          height: height,
          width: width,
          borderRadius: borderRadius,
          fit: fit,
          border: border,
        );
    }
  }
}
