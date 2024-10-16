part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  authenticatedFailed,
  authenticating,
  logOut,
}

class AuthState extends Equatable {
  final AuthStatus? status;
  const AuthState({this.status});

  factory AuthState.initialState() => const AuthState();

  AuthState copyWith({AuthStatus? status}) {
    return AuthState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
