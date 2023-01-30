import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/services/services_locator.dart';

import 'core/utills/bloc_observer.dart';
import 'movies/presentation/controllers/movies_controller/movies_bloc.dart';
import 'movies/presentation/controllers/movies_controller/movies_events.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        home: const MainMoviesScreen(),
      ),
    );
  }
}

class ButtonA extends StatelessWidget {
  const ButtonA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MainMoviesScreen();
              }));
            },
            icon: const Icon(Icons.add)),
      ),
    );
  }
}
