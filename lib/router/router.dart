import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/blog/blog_entries_list_page.dart';
import 'package:javier_website/view/blog/entry_detail_page.dart';
import 'package:javier_website/view/blog/new_entry_page.dart';
import 'package:javier_website/view/home/home.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutPaths.home,
    routes: [
      GoRoute(
        path: RoutPaths.home,
        name: 'home',
        builder: (context, state) => Home(title: localizations.title),
      ),
      GoRoute(
        path: RoutPaths.blogEntries,
        name: 'blog_entries',
        builder: (context, state) => const BlogEntriesListPage(),
      ),
      GoRoute(
        path: RoutPaths.blogEntry,
        name: 'blog_entry',
        builder: (context, state) {
          var entry = state.extra as Entry;
          return EntryDetailPage(entry: entry);
        },
      ),
      GoRoute(
        path: RoutPaths.blogNewEntry,
        name: 'blog_new_entry',
        builder: (context, state) {
          return const NewEntryPage();
        },
      ),
    ],
  );
}
