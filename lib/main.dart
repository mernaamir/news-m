import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layouts/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/screens/detailsScreen.dart';
import 'package:newsapp/screens/settings.dart';
import 'package:newsapp/shared/styles/my_theme.dart';
import 'splashScreen.dart';

import 'observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

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
initialRoute: splash.routeName,
     theme: MyThemeData.lighttheme,
     darkTheme: MyThemeData.darkTheme,
     routes: {
        home.routeName:(context)=>home(),
       settings.routeName:(context)=>settings(),
       splash.routeName:(context)=>splashScreen(),
       detailsScreen.routeName:(context)=>detailsScreen()
     },
    );
  }
}

