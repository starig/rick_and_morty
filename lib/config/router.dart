import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/features/details/view/details_view.dart';
import 'package:rick_and_morty/features/home/home.dart';

class AppRoutes {
  static const String homePath = '/';
  static const String detailsPath = '/details/:id';
}

class AppRouterHelper {
  static final AppRouterHelper _instance = AppRouterHelper._internal();

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

  static AppRouterHelper get instance => _instance;

  factory AppRouterHelper() {
    return _instance;
  }

  AppRouterHelper._internal() {
    final routes = [
      GoRoute(
        path: AppRoutes.homePath,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: AppRoutes.detailsPath,
        builder: (context, state) => DetailsView(
          id: int.parse(state.pathParameters['id']!),
        ),
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: AppRoutes.homePath,
      routes: routes,
    );
  }
}
