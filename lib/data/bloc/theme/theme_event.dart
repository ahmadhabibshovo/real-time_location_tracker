part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeThemeMode extends ThemeEvent {
  final BuildContext context;

  const ChangeThemeMode({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
