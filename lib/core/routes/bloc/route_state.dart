part of 'route_bloc.dart';

class RouteState extends Equatable {
  final String? path;
  final AuthStatus? authStatus;
  const RouteState({this.path, this.authStatus});

  factory RouteState.initialState() => const RouteState();

  RouteState copyWith({AuthStatus? authStatus, String? path}) {
    return RouteState(
      path: path ?? this.path,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  List<Object?> get props => [path, authStatus];
}
