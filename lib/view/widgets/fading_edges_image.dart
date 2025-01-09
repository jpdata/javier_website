import 'package:flutter/material.dart';

/// A widget that displays an image with edges fading into the background.
class FadingEdgesImage extends StatelessWidget {
  final String imagePath;
  final double fadeWidth; // Intensity of the fade effect on all edges
  final double width;
  final double height;
  final BoxFit fit;

  const FadingEdgesImage({
    super.key,
    required this.imagePath,
    this.fadeWidth = 30.0,
    this.width = 300,
    this.height = 300,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          double deltaX = fadeWidth / bounds.width;

          return LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: const [
              Colors.white,
              Colors.transparent,
              Colors.transparent,
              Colors.white,
            ],
            stops: [
              0.0,
              deltaX,
              1 - deltaX,
              1,
            ],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstOut,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            double deltaY = fadeWidth / bounds.height;

            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: const [
                Colors.white,
                Colors.transparent,
                Colors.transparent,
                Colors.white,
              ],
              stops: [
                0.0,
                deltaY,
                1 - deltaY,
                1.0,
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
