import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_location_tracker/config/routes/routes_name.dart';
import 'package:realtime_location_tracker/data/bloc/location/location_bloc.dart';
import 'package:realtime_location_tracker/data/bloc/theme/theme_bloc.dart';

import 'config/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LocationBloc()),
          BlocProvider(create: (BuildContext context) => ThemeBloc()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              themeMode: state.themeMode,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              initialRoute: RoutesName.splashScreen,
              onGenerateRoute: Routes.generateRoute,
            );
          },
        ));
  }
}
