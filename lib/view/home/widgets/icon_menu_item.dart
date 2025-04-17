import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class IconMenuItem extends StatefulWidget {
  final Function()? onTap;
  final double? width;
  final double? height;
  final String imagePath;
  final String? imagePathMouseOver;
  final String? tooltipTextMouseOver;
  final String? label;
  final Color? color;

  const IconMenuItem.iconMenuItem({
    super.key,
    this.onTap,
    this.width,
    this.height,
    required this.imagePath,
    this.imagePathMouseOver,
    this.tooltipTextMouseOver,
    this.label,
    this.color,
  });

  @override
  State<IconMenuItem> createState() => _IconMenuItemState();
}

class _IconMenuItemState extends State<IconMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Tooltip(
              message: _isHovered && widget.tooltipTextMouseOver != null ? widget.tooltipTextMouseOver! : '',
              child: Image(
                image: Svg(
                    _isHovered && widget.imagePathMouseOver != null ? widget.imagePathMouseOver! : widget.imagePath),
                width: widget.width ?? 32,
                height: widget.height ?? 32,
                color: widget.color ?? Theme.of(context).colorScheme.primary,
              ),
            ),
            if (widget.label != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  widget.label!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
