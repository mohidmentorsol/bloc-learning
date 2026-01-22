import 'package:bloc_learning/bloc/slider_bloc/slider_bloc.dart';
import 'package:bloc_learning/bloc/todo%20bloc/todo_bloc.dart';
import 'package:bloc_learning/ui/fav_view.dart';
import 'package:bloc_learning/ui/slider_view.dart';
import 'package:bloc_learning/ui/todo_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SliderBloc()),
        BlocProvider(create: (_) => TodoBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark, // forces dark mode

        theme: ThemeData.light(), // light theme
        darkTheme: ThemeData.dark(), // dark theme

        home: const FavView(),
      ),
    );
  }
}
