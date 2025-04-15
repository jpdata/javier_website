import 'package:flutter/material.dart';
import 'package:javier_website/view/themes/app_theme.dart';

class FadeInOutText extends StatefulWidget {
  const FadeInOutText({super.key, required this.text});
  final String text;

  @override
  State<FadeInOutText> createState() => _FadeInOutTextState();
}

class _FadeInOutTextState extends State<FadeInOutText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold,
          fontFamily: "GalaxyBt",
          color: AppTheme.lightTheme.colorScheme.secondary,
          backgroundColor: AppTheme.lightTheme.colorScheme.primary, // Color de fondo del texto
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
