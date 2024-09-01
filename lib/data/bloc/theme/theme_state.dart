part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({this.themeMode = ThemeMode.system});
  final ThemeMode themeMode;

  @override
  // TODO: implement props
  List<Object?> get props => [themeMode];

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
