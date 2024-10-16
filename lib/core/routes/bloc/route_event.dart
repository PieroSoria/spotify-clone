part of 'route_bloc.dart';

abstract class RouteEvent extends Equatable {
  factory RouteEvent.onNavigatorPath(String path) =>
      _OnNavigatorPath(path: path);
  factory RouteEvent.onVerifyAuth() => _OnVerifyAuth();

  @override
  List<Object?> get props => [];
}

class _OnVerifyAuth implements RouteEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnNavigatorPath implements RouteEvent {
  final String path;

  _OnNavigatorPath({required this.path});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
