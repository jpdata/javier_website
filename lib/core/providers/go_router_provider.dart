import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/router/router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return AppRouter.router;
});
