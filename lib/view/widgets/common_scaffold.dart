import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:javier_website/core/assets.dart';
import 'package:javier_website/core/l10n/dynamic_app_localizations.dart';
import 'package:javier_website/core/providers/go_router_provider.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/drawer/main_drawer.dart';

class CommonScaffold extends ConsumerStatefulWidget {
  final Widget child;
  final bool showBackButton;
  final bool showDrawer;
  final bool showTitle;
  final String? title;
  final Icon backButtonIcon;
  final Function()? floatingButtonAction;
  final Icon? floatingButtonIcon;
  final List<Widget>? actions;

  const CommonScaffold(
      {super.key,
      this.showBackButton = false,
      this.showDrawer = true,
      this.showTitle = true,
      this.title,
      this.backButtonIcon = const Icon(Icons.arrow_back_ios),
      this.floatingButtonAction,
      this.floatingButtonIcon,
      this.actions,
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
    final currentRoute = goRouter.state.name ?? '';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.title != null ? widget.title! : DynamicAppLocalizations.of(context).translate(currentRoute)),
            const SizedBox(width: 30),
            ...(widget.actions != null
                ? [
                    for (var i = 0; i < widget.actions!.length; i++) ...[
                      widget.actions![i],
                      if (i < widget.actions!.length - 1) const SizedBox(width: 8),
                    ],
                  ]
                : []),
          ],
        ),
        backgroundColor: AppTheme.lightTheme.colorScheme.primary,
        foregroundColor: AppTheme.lightTheme.colorScheme.onPrimary,
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
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppTheme.lightTheme.colorScheme.primary,
          image: DecorationImage(
            image: const Image(
              image: Svg(Assets.bgTile),
            ).image,
            repeat: ImageRepeat.repeat,
            scale: 1.5,
            colorFilter: ColorFilter.mode(Colors.black.withAlpha(38), BlendMode.dstATop),
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
