import 'dart:developer' as developer;

import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/model/news_entry.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/blog/blog_entries_list_page.dart';
import 'package:javier_website/view/blog/edit_entry_page.dart';
import 'package:javier_website/view/blog/entry_detail_page.dart';
import 'package:javier_website/view/blog/new_entry_page.dart';
import 'package:javier_website/view/home/home.dart';
import 'package:javier_website/view/news/news_edit_entry_page.dart';
import 'package:javier_website/view/news/news_entries_list_page.dart';
import 'package:javier_website/view/news/news_entry_detail_page.dart';
import 'package:javier_website/view/news/news_new_entry_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutPaths.home,
    routes: [
      GoRoute(
        path: RoutPaths.home,
        name: RoutNames.home,
        builder: (context, state) => Home(title: localizations.title),
      ),
      //-------------------BLOG-------------------
      GoRoute(
        path: RoutPaths.blogEntries,
        name: RoutNames.blogEntries,
        builder: (context, state) => const BlogEntriesListPage(),
      ),
      GoRoute(
        path: RoutPaths.blogEntry,
        name: RoutNames.blogEntry,
        builder: (context, state) {
          return EntryDetailPage(id: state.pathParameters['id']!);
        },
      ),
      GoRoute(
        path: RoutPaths.blogEditEntry,
        name: RoutNames.blogEditEntry,
        builder: (context, state) {
          var entry = (state.extra is Map) ? Entry.fromJson(state.extra as Map<String, Object?>) : state.extra as Entry;
          return EditEntryPage(entry: entry);
        },
      ),
      GoRoute(
        path: RoutPaths.blogNewEntry,
        name: RoutNames.blogNewEntry,
        builder: (context, state) {
          return const NewEntryPage();
        },
      ),
      //-------------------NEWS-------------------
      GoRoute(
        path: RoutPaths.newsEntries,
        name: RoutNames.newsEntries,
        builder: (context, state) => const NewsEntriesListPage(),
      ),
      GoRoute(
        path: RoutPaths.newsEntry,
        name: RoutNames.newsEntry,
        builder: (context, state) {
          developer.log('state.pathParameters: ${state.pathParameters['id']}');
          return NewsEntryDetailPage(entryId: state.pathParameters['id']!);
        },
      ),
      GoRoute(
        path: RoutPaths.newsEditEntry,
        name: RoutNames.newsEditEntry,
        builder: (context, state) {
          var entry =
              (state.extra is Map) ? NewsEntry.fromJson(state.extra as Map<String, Object?>) : state.extra as NewsEntry;
          return NewsEditEntryPage(newsEntry: entry);
        },
      ),
      GoRoute(
        path: RoutPaths.newsNewEntry,
        name: RoutNames.newsNewEntry,
        builder: (context, state) {
          return const NewsNewEntryPage();
        },
      ),

      //-------------------AUTH-------------------
      GoRoute(
        path: RoutPaths.signIn,
        name: RoutNames.signIn,
        builder: (context, state) => const NewsEntriesListPage(),
      ),
    ],
  );
}
