import 'package:flutter/material.dart';

class Unfolding extends StatefulWidget {
  final Widget child;
  final Duration duration;

  /// Constructor del widget desenrollable.
  /// [child] es el widget que será animado.
  /// [duration] es el tiempo que tarda en desenrollarse.
  const Unfolding({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    super.key,
  });

  @override
  State<Unfolding> createState() => _UnfoldingState();
}

class _UnfoldingState extends State<Unfolding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Inicia la animación al crear el widget.
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Método para iniciar la animación manualmente.
  void unfold() => _controller.forward();

  /// Método para revertir la animación.
  void fold() => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.vertical,
      axisAlignment: -1.0, // Se expande hacia abajo desde arriba
      child: widget.child,
    );
  }
}
