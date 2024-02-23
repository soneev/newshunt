import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:newshunt/utils/colors/colors.dart';

class CustomPngImage extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final Color? color;

  const CustomPngImage(
      {super.key,
      this.imageName,
      this.height,
      this.width,
      this.boxFit,
      this.color});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/$imageName.png',
      color: color,
      height: height ?? 30,
      width: width ?? 30,
      fit: boxFit ?? BoxFit.contain,
      isAntiAlias: true,
    );
  }
}

class CustomImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final Color? color;

  const CustomImageNetwork(
      {super.key,
      this.imageUrl,
      this.height,
      this.width,
      this.boxFit,
      this.color});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? '',
      color: color,
      height: height ?? 30,
      width: width ?? 30,
      fit: boxFit ?? BoxFit.contain,
      isAntiAlias: true,
    );
  }
}

// ignore: must_be_immutable
class CustomSvgImage extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? boxFit;
  bool transform;
  CustomSvgImage(
      {super.key,
      this.imageName,
      this.height,
      this.width,
      this.color,
      this.boxFit,
      this.transform = true});
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: (Directionality.of(context) == TextDirection.ltr)
          ? Matrix4.rotationY(0)
          : Matrix4.rotationY(transform ? math.pi : 0),
      child: SvgPicture.asset(
        'assets/svg/$imageName.svg',
        height: height ?? 30,
        width: width ?? 30,
        fit: boxFit ?? BoxFit.contain,
        color: color,
      ),
    );
  }
}

class CustomDummyImage extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final Color? color;

  const CustomDummyImage(
      {super.key,
      this.imageName,
      this.height,
      this.width,
      this.boxFit,
      this.color});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image.png',
      color: color,
      height: height ?? 30,
      width: width ?? 30,
      fit: boxFit ?? BoxFit.contain,
      isAntiAlias: true,
    );
  }
}

// ignore: must_be_immutable
class CachedImageLoader extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  BoxFit? boxFit;
  // BoxFit? fit = BoxFit.fill;

  CachedImageLoader({
    this.boxFit,
    required this.imageUrl,
    this.width = 100.0,
    this.height = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit,
      imageUrl: imageUrl ?? '',
      width: width,
      height: height,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primeryLite,
      )),
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
    );
  }
}
