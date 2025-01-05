import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Row(
          children: [
            // SVG 1 (10% izquierda, repetida verticalmente)
            Image(
              image: Svg('assets/images/bg-lp-c.svg'),
            ),
            // // SVG 2 (80% central, repetida vertical y horizontalmente)
            // Expanded(
            //   flex: 8,
            //   child: CustomPaint(
            //     painter: SvgPatternPainter('assets/images/bg-mp-c-8.svg',
            //         TileMode.repeated, TileMode.repeated),
            //   ),
            // ),
            // // SVG 3 (10% derecha, repetida verticalmente)
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.1,
            //   child: CustomPaint(
            //     painter: SvgPatternPainter('assets/images/bg-rp-c.svg',
            //         TileMode.repeated, TileMode.repeated),
            //   ),
            // ),
          ],
        ),
        // Widgets de la app encima del fondo
        //child,
      ],
    );
  }
}
