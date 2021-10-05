import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matchfinder/Constants/constants.dart';
import 'package:matchfinder/Reusable/reusable_guide_screen_images.dart';
import 'package:matchfinder/Reusable/reusable_guide_screen_text.dart';


/*
* In this screen we have a listview which contains the guide steps and images
* All the Reusable widgets have been taken from the Reusable/.. directory
* All the constants from Constants/.. directory
* Google fonts used for fonts
* */

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);

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
        ),
        child: Stack(
          children: <Widget>[
            ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                  child: Text(
                    'Dont know how to use it.?',
                    style: kGuideScreenMainTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Here we are to help You..',
                    style: kGuideScreenTextOneStyle,
                  ),
                ),
                const SizedBox(height: 20.0),

                /*
                * This is the text reusable widget
                * */
                ReusableGuideStepsText(
                    steps: '1. Opening the app will show the loading screen.'),
                const SizedBox(height: 10.0),

                /*
                * This is the image reusable widget
                * */
                ReusableGuideStepsImages(
                  name: 'logo1.png',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                /*
                * This is the text reusable widget
                * */
                ReusableGuideStepsText(
                    steps: '2. Next The app redirects to the Home page.'),
                const SizedBox(height: 10.0),
                ReusableGuideStepsText(
                    steps:
                        '3. Here you have to choose the option to take the image. Either from Camera or Gallery'),
                const SizedBox(height: 10.0),
                /*
                * This is the image reusable widget
                * */
                ReusableGuideStepsImages(
                  name: 'homepage.jpg',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                /*
                * This is the text reusable widget
                * */
                ReusableGuideStepsText(steps: '4.After choosing the image The app will process the request and redirects the user to the Result Screen.'),
                const SizedBox(height: 10.0),
                /*
                * This is the image reusable widget
                * */
                ReusableGuideStepsImages(
                  name: 'result.jpg',
                ),
               const SizedBox(height: 10.0,),
                Center(child: Text('THANK YOU', style: GoogleFonts.merriweather(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),)),
                const SizedBox(height: 100.0,),
              ],
            ),

            /*
            *
            * The below button to redirect back to home page.
            * */
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.deepOrangeAccent,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'CLOSE',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
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

