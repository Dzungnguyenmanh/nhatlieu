// ignore_for_file: file_names, must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HImageView extends StatelessWidget {
  String? url;
  String? imagePath;
  String? svgPath;

  File? file;

  double? height;
  double? width;
  Color? color;
  BoxFit? fit;
  Alignment? alignment;
  final String placeHolder;
  VoidCallback? onTap;
  EdgeInsetsGeometry? margin;
  BorderRadius? radius;
  BoxBorder? border;

  HImageView(
      {super.key,
      this.url,
      this.imagePath,
      this.svgPath,
      this.file,
      this.alignment,
      this.height,
      this.width,
      this.border,
      this.color,
      this.fit,
      this.margin,
      this.onTap,
      this.placeHolder = 'assets/images/image_not_found.png',
      this.radius});

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildWidget(),
          )
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
        padding: margin ?? EdgeInsets.zero,
        child: InkWell(
          onTap: onTap,
          child: _buildCircleImage(),
        ));
  }

  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(border: border, borderRadius: radius,color: color),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(file!,
          height: height, width: width, fit: fit ?? BoxFit.cover);
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: url!,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => SizedBox(
            height: height,
            width: width,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey.shade100,
              color: Colors.grey.shade200,
            )),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder,
          width: 150,
          height: 150,
          fit: fit ?? BoxFit.cover,
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(imagePath!,
          height: height, width: width, fit: fit ?? BoxFit.none);
    }

    return const SizedBox();
  }
}
