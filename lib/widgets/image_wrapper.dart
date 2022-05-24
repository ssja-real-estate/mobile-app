import 'dart:io';

import 'package:flutter/material.dart';

class ImageWrapper extends StatelessWidget {
  final String imageUrl;
  final void Function()? onTap;
  const ImageWrapper({
    Key? key,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
