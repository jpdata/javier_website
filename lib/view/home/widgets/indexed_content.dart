import 'package:flutter/material.dart';
import 'package:javier_website/view/home/widgets/about_me_content.dart';
import 'package:javier_website/view/home/widgets/credits_content.dart';
import 'package:javier_website/view/home/widgets/news_entries_from_firebase.dart';
import 'package:javier_website/view/home/widgets/portfolio_content.dart';
import 'package:javier_website/view/home/widgets/resumed_news_entries_content.dart';

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
            if (_lastIndex == 0) NewsEntriesFromFirebase(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 2) CreditsContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 3) ResumedEntriesContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 4) AboutMeContent(key: Key(_lastIndex.toString()), unfold: false),
            PortfolioContent(key: Key(widget.index.toString())),
          ],
        );
        break;
      case 2:
        result = Column(
          children: [
            if (_lastIndex == 0) NewsEntriesFromFirebase(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 1) PortfolioContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 3) ResumedEntriesContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 4) AboutMeContent(key: Key(_lastIndex.toString()), unfold: false),
            CreditsContent(key: Key(widget.index.toString())),
          ],
        );
        break;
      case 3:
        result = Column(
          children: [
            if (_lastIndex == 0) NewsEntriesFromFirebase(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 1) PortfolioContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 2) CreditsContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 4) AboutMeContent(key: Key(_lastIndex.toString()), unfold: false),
            ResumedEntriesContent(key: Key(widget.index.toString())),
          ],
        );
        break;
      case 4:
        result = Column(
          children: [
            if (_lastIndex == 0) NewsEntriesFromFirebase(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 1) PortfolioContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 2) CreditsContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 3) ResumedEntriesContent(key: Key(_lastIndex.toString()), unfold: false),
            AboutMeContent(key: Key(widget.index.toString())),
          ],
        );
        break;
      default: //0
        result = Column(
          children: [
            if (_lastIndex == 1) PortfolioContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 2) CreditsContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 3) ResumedEntriesContent(key: Key(_lastIndex.toString()), unfold: false),
            if (_lastIndex == 4) AboutMeContent(key: Key(_lastIndex.toString()), unfold: false),
            NewsEntriesFromFirebase(key: Key(widget.index.toString())),
          ],
        );
    }
    _lastIndex = widget.index;
    return result;
  }
}
