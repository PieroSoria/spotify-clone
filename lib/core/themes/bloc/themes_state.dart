part of 'themes_bloc.dart';

class ThemesState extends Equatable {
  final bool? isdark;
  const ThemesState({this.isdark});

  factory ThemesState.initialState() => const ThemesState(isdark: false);

  ThemesState copyWith({bool? isdark}) {
    return ThemesState(isdark: isdark ?? this.isdark);
  }

  @override
  List<Object?> get props => [isdark];
}
