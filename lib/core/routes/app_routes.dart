import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_app/features/auth/presentation/pages/auth_page.dart';
import 'package:my_app/features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static const home = '/';
  static const auth = '/auth';

  static GoRouter routerConfig(AuthStatus authStatus) => GoRouter(
        initialLocation: home,
        routes: [
          GoRoute(
            path: home,
            pageBuilder: (context, state) => _materialView(
              state.pageKey,
              const HomePage(),
            ),
            redirect: (context, state) => switch (authStatus) {
              AuthStatus.unauthenticated => auth,
              AuthStatus.authenticated => home,
              _ => home,
            },
          ),
          GoRoute(
            path: auth,
            pageBuilder: (context, state) => _materialView(
              state.pageKey,
              const AuthPage(),
            ),
          )
        ],
      );

  static CustomTransitionPage _materialView(dynamic pagekey, Widget view) {
    return CustomTransitionPage(
      child: view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
