
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/router/rout_names.dart';
import 'package:javier_website/view/home/home.dart';
import 'package:javier_website/view/items/items.dart';

class AppRouter {
 static final  GoRouter router = GoRouter(
      initialLocation: RoutNames.home,
      routes:  [
        GoRoute(
          path: RoutNames.home,
          builder: (context, state) => Home(title: localizations.title),
        ),
        GoRoute(
          path: '/item1',
          builder: (context, state) => const Item1Page(),
        ),
        GoRoute(
          path: '/item2',
          builder: (context, state) => const Item2Page(),
        ),
      ],
    
    );
}