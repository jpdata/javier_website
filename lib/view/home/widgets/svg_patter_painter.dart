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
  bool _isLoading = false;

  SvgPatternPainter(this.assetPath, this.tileModeX, this.tileModeY) {
    _loadSvgImage();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_image == null) {
      // Opcional: puedes dibujar un placeholder si la imagen aún no está lista
      final placeholderPaint = Paint()..color = Colors.grey;
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        placeholderPaint,
      );
      return;
    }

    final paint = Paint();
    if (tileModeX == TileMode.repeated && tileModeY == TileMode.repeated) {
      for (double dx = 0; dx < size.width; dx += _image!.width.toDouble()) {
        for (double dy = 0; dy < size.height; dy += _image!.height.toDouble()) {
          canvas.drawImage(_image!, Offset(dx, dy), paint);
        }
      }
      return;
    }

    if (tileModeX == TileMode.repeated) {
      for (double dx = 0; dx < size.width; dx += _image!.width.toDouble()) {
        canvas.drawImage(_image!, Offset(dx, 0), paint);
      }
    }
    if (tileModeY == TileMode.repeated) {
      for (double dy = 0; dy < size.height; dy += _image!.height.toDouble()) {
        canvas.drawImage(_image!, Offset(0, dy), paint);
      }
    }
  }

  /// Carga el SVG y lo convierte en una imagen
  Future<void> _loadSvgImage() async {
    if (_isLoading) return; // Evita cargas simultáneas
    _isLoading = true;

    final pictureInfo = await vg.loadPicture(
      SvgAssetLoader(assetPath),
      null,
    );

    _image = await pictureInfo.picture
        .toImage(50, 50); // Tamaño deseado de la imagen
    _isLoading = false;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
