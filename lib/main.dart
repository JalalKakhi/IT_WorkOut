
import 'package:IT_workout/IT_workout/layout/layout_screen.dart';
import 'package:IT_workout/IT_workout/modules/trainingScreen/training_screen.dart';
import 'package:IT_workout/IT_workout/shared/bloc_observer.dart';
import 'package:IT_workout/IT_workout/shared/networking/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.initial();
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
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0.0,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),



        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: HexColor("#a60000"),
          unselectedItemColor: Colors.grey,
          backgroundColor: HexColor("#fbfcfc")


        ),
      ),
      home: LayoutScreen(),
    );
  }
}


