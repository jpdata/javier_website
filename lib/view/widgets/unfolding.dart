import 'package:flutter/material.dart';

class Unfolding extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool unfold;

  /// Constructor privado del widget desenrollable.
  const Unfolding._({
    required this.unfold,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  /// Factory constructor para desenrollar.
  factory Unfolding.unfold({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return Unfolding._(duration: duration, unfold: true, child: child);
  }

  /// Factory constructor para enrollar.
  factory Unfolding.fold({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return Unfolding._(duration: duration, unfold: false, child: child);
  }

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

    // Configura la dirección inicial de la animación.
    if (widget.unfold) {
      _controller.value = 1.0; // Estado desenrollado
    } else {
      _controller.value = 0.0; // Estado enrollado
    }
  }

  @override
  void didUpdateWidget(Unfolding oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Verifica si la propiedad `unfold` ha cambiado y ajusta la animación.
    if (oldWidget.unfold != widget.unfold) {
      if (widget.unfold) {
        _controller.forward(); // Desenrollar
      } else {
        _controller.reverse(); // Enrollar
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
