import 'package:flutter/material.dart';
import 'package:matchfinder/Screens/home_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const String name ='intro_screen';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(
      seconds: 2,
    ),
            ()=>Navigator.pushNamed(context, HomePage.name));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4be4ff), Colors.indigo],
            begin: FractionalOffset(0.5, 0.0),
          ),
          color: Color(0xff4be4ff),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: 300.0,
                width: 300.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}