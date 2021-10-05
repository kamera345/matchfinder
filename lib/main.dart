import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matchfinder/Screens/intro_screen.dart';
import 'package:matchfinder/Screens/result_screen.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final string = 'Match Finder';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: string,
      theme: ThemeData.dark(),
      initialRoute:IntroPage.name,
      routes: {
        HomePage.name: (context)=>const HomePage(),
        IntroPage.name: (context)=>const IntroPage(),
        ResultScreen.name:(context)=>const ResultScreen(),
      },
    );
  }
}



