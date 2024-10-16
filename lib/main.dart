import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/routes/app_routes.dart';
import 'package:my_app/core/routes/bloc/route_bloc.dart';
import 'package:my_app/core/themes/bloc/themes_bloc.dart';
import 'package:my_app/core/themes/themes.dart';
import 'package:my_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_app/injector_dependency.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectorDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RouteBloc>(
          create: (context) => sl()..add(RouteEvent.onVerifyAuth()),
        ),
        BlocProvider<ThemesBloc>(
          create: (context) => sl(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<RouteBloc, RouteState>(
          builder: (context, stateroute) {
            return BlocBuilder<ThemesBloc, ThemesState>(
              builder: (context, statetheme) {
                return MaterialApp.router(
                  title: 'Flutter Demo',
                  routerConfig: AppRoutes.routerConfig(
                    stateroute.authStatus ?? AuthStatus.unauthenticated,
                  ),
                  debugShowCheckedModeBanner: false,
                  theme:
                      statetheme.isdark! ? Themes.darkTheme : Themes.lighTheme,
                );
              },
            );
          },
        );
      }),
    );
  }
}
