import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uidesign/Screens/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netraa App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        primaryColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
