part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  authenticatedFailed,
  authenticating,
  logOut,
}

class AuthState extends Equatable {
  final bool? isremember;
  final AuthStatus? status;
  const AuthState({this.isremember, this.status});

  factory AuthState.initialState() => const AuthState(isremember: false);

  AuthState copyWith({bool? isremember, AuthStatus? status}) {
    return AuthState(
      isremember: isremember ?? this.isremember,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, isremember];
}
