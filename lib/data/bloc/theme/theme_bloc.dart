import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ChangeThemeMode>(_changeThemeMode);
  }
  _changeThemeMode(ChangeThemeMode event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
        themeMode: Theme.of(event.context).brightness == Brightness.dark
            ? ThemeMode.light
            : ThemeMode.dark));
  }
}
