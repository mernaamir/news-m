import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  static Color lightcolor=Colors.white;
 static ThemeData lighttheme=ThemeData(
     appBarTheme: AppBarTheme(
         iconTheme: IconThemeData(
             color: Colors.white
         ),
         centerTitle: true,
         backgroundColor: Colors.green,
         titleTextStyle: GoogleFonts.elMessiri(
             fontWeight: FontWeight.bold,color: Colors.white)
     )
 );
 static ThemeData darkTheme=ThemeData(


     appBarTheme: AppBarTheme(
         iconTheme: IconThemeData(
             color: Colors.black
         ),
         centerTitle: true,
         backgroundColor: Colors.green,
         titleTextStyle: GoogleFonts.elMessiri(
             fontWeight: FontWeight.bold,color: Colors.white)
     )
 );
}