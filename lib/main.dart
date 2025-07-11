import 'package:flutter/material.dart';
import 'package:movie_app/Feature/Views/HomeScreen/home_screen.dart';
import 'package:movie_app/Feature/main_view.dart';
import 'package:movie_app/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: Colors.white
          ),
          bodyMedium: TextStyle(
            color: Colors.white
          )
        )

      ),
      home: MainView(),
    );
  }
}
