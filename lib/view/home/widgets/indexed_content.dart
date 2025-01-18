import 'package:flutter/material.dart';
import 'package:javier_website/view/home/widgets/credits_content.dart';
import 'package:javier_website/view/home/widgets/portfolio_content.dart';

class IndexedContent extends StatefulWidget {
  final int index;

  const IndexedContent({super.key, required this.index});

  @override
  State<IndexedContent> createState() => _IndexedContentState();
}

class _IndexedContentState extends State<IndexedContent> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.index) {
      0 => Container(),
      1 => PortfolioContent(),
      2 => CreditsContent(),
      _ => Container()
    };
  }
}
