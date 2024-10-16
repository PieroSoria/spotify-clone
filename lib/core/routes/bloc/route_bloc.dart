import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/core/helper/app_constants.dart';
import 'package:my_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final SharedPreferences sharedPreferences;
  final GoRouter goRouter;
  RouteBloc(this.sharedPreferences, this.goRouter)
      : super(RouteState.initialState()) {
    on<_OnNavigatorPath>(_onNavigatorPath);
    on<_OnVerifyAuth>(_onVerifyAuth);
  }

  void _onNavigatorPath(_OnNavigatorPath event, Emitter<RouteState> emit) {
    goRouter.go(event.path);
  }

  void _onVerifyAuth(_OnVerifyAuth event, Emitter<RouteState> emit) {
    final status = sharedPreferences.getString(AppConstants.authStatus);
    final authStatus = converterString(status ?? '');
    emit(state.copyWith(authStatus: authStatus));
  }

  AuthStatus converterString(String enumStatus) {
    return switch (enumStatus) {
      'authenticated' => AuthStatus.authenticated,
      'unauthenticated' => AuthStatus.unauthenticated,
      'authenticatedFailed' => AuthStatus.authenticatedFailed,
      'authenticating' => AuthStatus.authenticating,
      'logOut' => AuthStatus.logOut,
      _ => AuthStatus.unauthenticated,
    };
  }
}
