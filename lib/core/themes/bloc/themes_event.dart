part of 'themes_bloc.dart';

abstract class ThemesEvent extends Equatable {
  factory ThemesEvent.onGetSaveTheme() => _OnGetSaveTheme();
  factory ThemesEvent.onChangeTheme() => _OnChangeTheme();

  @override
  List<Object?> get props => [];
}

class _OnChangeTheme implements ThemesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnGetSaveTheme implements ThemesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
