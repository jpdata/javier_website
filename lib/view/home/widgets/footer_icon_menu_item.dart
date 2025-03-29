import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class FooterIconMenuItem extends StatefulWidget {
  final Function()? onTap;
  final double? width;
  final double? height;
  final String imagePath;
  final String? imagePathMouseOver;

  const FooterIconMenuItem({
    super.key,
    this.onTap,
    this.width,
    this.height,
    required this.imagePath,
    this.imagePathMouseOver,
  });

  @override
  State<FooterIconMenuItem> createState() => _FooterIconMenuItemState();
}

class _FooterIconMenuItemState extends State<FooterIconMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Image(
          image: Svg(_isHovered && widget.imagePathMouseOver != null
              ? widget.imagePathMouseOver!
              : widget.imagePath),
          width: widget.width ?? 32,
          height: widget.height ?? 32,
        ),
      ),
    );
  }
}
