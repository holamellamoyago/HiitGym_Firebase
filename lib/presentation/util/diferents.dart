import 'package:flutter/material.dart';

class ImagenLogo extends StatelessWidget {
  const ImagenLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo(1).jpg',
      height: 200,
    );
  }
}