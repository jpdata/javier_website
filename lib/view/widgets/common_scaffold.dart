import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/l10n/dynamic_app_localizations.dart';
import 'package:javier_website/core/providers/go_router_provider.dart';
import 'package:javier_website/view/Themes/app_theme.dart';
import 'package:javier_website/view/widgets/main_drawer.dart';

class CommonScaffold extends ConsumerStatefulWidget {
  final Widget child;
  final bool showBackButton;
  final bool showDrawer;
  final bool showTitle;
  final String? title;
  final Icon backButtonIcon;
  final Function()? floatingButtonAction;
  final Icon? floatingButtonIcon;

  const CommonScaffold(
      {super.key,
      this.showBackButton = false,
      this.showDrawer = true,
      this.showTitle = true,
      this.title,
      this.backButtonIcon = const Icon(Icons.arrow_back_ios),
      this.floatingButtonAction,
      this.floatingButtonIcon,
      required this.child});

  @override
  ConsumerState<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends ConsumerState<CommonScaffold> {
  @override
  Widget build(BuildContext context) {
    return _scaffoldThenBackground(widget.child);
  }

  Widget _scaffoldThenBackground(Widget child) {
    final goRouter = ref.watch(goRouterProvider);
    final currentRoute = goRouter.state?.name ?? '';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.title != null
            ? widget.title!
            : DynamicAppLocalizations.of(context).translate(currentRoute)),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.lightTheme.colorScheme.primary,
        leading: widget.showBackButton
            ? IconButton(
                icon: widget.backButtonIcon,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : null,
      ),
      backgroundColor: Colors.transparent,
      drawer: const MainDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppTheme.lightTheme.colorScheme.primary,
          image: DecorationImage(
            image: const Image(
              image: Svg('assets/images/bg-tile-part-c.svg'),
            ).image,
            repeat: ImageRepeat.repeat,
            scale: 1.5,
            colorFilter:
                ColorFilter.mode(Colors.black.withAlpha(38), BlendMode.dstATop),
          ),
        ),
        child: child,
      ),
      floatingActionButton: widget.floatingButtonAction != null
          ? FloatingActionButton(
              onPressed: () {
                widget.floatingButtonAction?.call();
              },
              child: widget.floatingButtonIcon ?? const Icon(Icons.add),
            )
          : null,
    );
  }
}
