import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/error_handler.dart';
import 'package:javier_website/view/blog/entry_detail_widget.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:javier_website/viewmodel/auth/auth_view_model.dart';
import 'package:javier_website/viewmodel/blog/entries_view_model.dart';

class EntryDetailPage extends ConsumerStatefulWidget {
  final String id;
  final bool? showBackButton;

  const EntryDetailPage({super.key, required this.id, this.showBackButton});

  @override
  ConsumerState<EntryDetailPage> createState() => _EntryDetailPageState();
}

class _EntryDetailPageState extends ConsumerState<EntryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final entry = ref.watch(entryViewModelProvider(widget.id));
    final authStateAsync = ref.watch(authViewModelProvider);
    double screenWidth = MediaQuery.of(context).size.width < 600
        ? MediaQuery.of(context).size.width / 4
        : MediaQuery.of(context).size.width;

    // Detectar si la ruta es SEO-friendly
    bool showBackButton = widget.showBackButton ?? true;
    final modalRoute = ModalRoute.of(context);
    final routeName = modalRoute?.settings.name;
    // Si la ruta es la SEO-friendly, ocultar el botón
    if (routeName == 'blog_detail') {
      showBackButton = false;
    }

    // Si la ruta es la SEO-friendly, mostrar botón Home en la AppBar
    List<Widget>? actions;
    bool showDrawer = true;
    if (routeName == 'blog_detail') {
      actions = [IconButton(icon: const Icon(Icons.home), tooltip: 'Ir al inicio', onPressed: () => context.go('/'))];
      showDrawer = false;
    }

    return CommonScaffold(
      showBackButton: showBackButton,
      showDrawer: showDrawer,
      title: 'Artículo',
      showTitle: true,
      actions: actions,
      child: entry.when(
        data: (data) {
          final isLoggedIn = authStateAsync is AsyncData && (authStateAsync.value?.isLoggedIn ?? false);
          final isManualLogin = authStateAsync is AsyncData && (authStateAsync.value?.email != "admin@javiprato.eu");
          final showEditButton = isLoggedIn && isManualLogin;
          return Padding(
            padding: EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: EntryDetailWidget(entry: data, showEditEntryButton: showEditButton),
            ),
          );
        },
        error: (error, stackTrace) => Center(child: ErrorHandler.errorWidget(error)),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
