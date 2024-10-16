part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  factory AuthEvent.onloginAuth(
          {required String email, required String password}) =>
      _OnloginAuth(email: email, password: password);
  factory AuthEvent.onChangeRemember() => _OnChangeRemember();

  @override
  List<Object?> get props => [];
}

class _OnChangeRemember implements AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnloginAuth implements AuthEvent {
  final String email;
  final String password;

  _OnloginAuth({required this.email, required this.password});
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}
