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
  int _lastIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget result;
    switch (widget.index) {
      case 1:
        result = Column(
          children: [
            if (_lastIndex == 2)
              CreditsContent(key: Key(_lastIndex.toString()), unfold: false),
            PortfolioContent(key: Key(widget.index.toString())),
          ],
        );
      case 2:
        result = Column(
          children: [
            if (_lastIndex == 1)
              PortfolioContent(key: Key(_lastIndex.toString()), unfold: false),
            CreditsContent(key: Key(widget.index.toString())),
          ],
        );
      default:
        result = Container();
    }
    _lastIndex = widget.index;
    return result;
  }
}
