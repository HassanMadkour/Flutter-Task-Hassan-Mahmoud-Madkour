import 'package:flutter_task/features/bundles/presentation/view/pages/bundle_view.dart';
import 'package:flutter_task/features/home/presentation/view/pages/filter_view.dart';
import 'package:flutter_task/features/home/presentation/view/pages/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String bundleRoute = '/bundle';
  static const String filterRoute = '/filter';
  static final appRouter = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const BundleView()),
      GoRoute(path: '/bundle', builder: (context, state) => const HomeView()),
      GoRoute(path: '/filter', builder: (context, state) => const FilterView()),
    ],
  );
}
