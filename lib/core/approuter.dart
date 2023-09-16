import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmanager/screens/home/views/homeview.dart';
import 'package:taskmanager/screens/login_screen/views/login_view.dart';

class AppRouter{
  static String home='/home';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },

      ),
      GoRoute(
        path:home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },

      ),
    ],
  );
}