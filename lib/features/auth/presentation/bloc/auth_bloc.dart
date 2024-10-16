import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initialState()) {
    on<_OnloginAuth>(_onloginAuth);
    on<_OnChangeRemember>(_onChangeRemember);
  }

  final email = TextEditingController();
  final password = TextEditingController();

  void _onloginAuth(_OnloginAuth event, Emitter<AuthState> emit) {}

  void _onChangeRemember(_OnChangeRemember event, Emitter<AuthState> emit) {
    emit(state.copyWith(isremember: !state.isremember!));
  }
}
