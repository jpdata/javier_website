// CustomPainter para dibujar SVG de forma repetida
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPatternPainter extends CustomPainter {
  final String assetPath;
  final TileMode tileModeX;
  final TileMode tileModeY;
  ui.Image? _image;

  SvgPatternPainter(this.assetPath, this.tileModeX, this.tileModeY) {
    _loadSvgAsImage();
  }

  Future<void> _loadSvgAsImage() async {
    final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetPath), null);
    final picture = pictureInfo.picture;
    _image = await picture.toImage(100, 100); // Tamaño base para repetición
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_image == null) return;

    final paint = Paint()
      ..shader = ImageShader(
        _image!,
        tileModeX,
        tileModeY,
        Matrix4.identity().storage,
      );

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
