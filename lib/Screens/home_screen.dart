import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matchfinder/Constants/constants.dart';
import 'package:matchfinder/Reusable/reusable_button_childs.dart';
import 'package:matchfinder/Screens/result_screen.dart';
import 'package:matchfinder/Model/model.dart';
import 'package:image_picker/image_picker.dart';


import 'guide.dart';

/*
* This is a home page
* All the contants used in this file are taken from Constants/constants.dart file
* And here we can choose image from gallery or from camera to begin process
* once it finds the match it navigate to resultscreen
* */

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String name = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /*
  * The below imageTaskHandler function is to handle the task after clicking one of the options
  * either camera or gallery
  * In this function we have :
  * 1.Image picker which handles picking of images from gallery or taking from camera
  * 2.As we are not integrated any api to process we used a different approach to create the process
  * 3.we generate random number after picking the image and pass it to the model( which handles the logic)
  * 4. And after a 2 sec delay we navigate to result screen
  * */
  imageTaskHandler(int value) async {
    final ImagePicker image = ImagePicker();
    value == 1
        ? await image.pickImage(source: ImageSource.camera)
        : await image.pickImage(source: ImageSource.gallery);
    var random = Random().nextInt(10);
    //Here we are passing random number as a value to model which is required
    var model = Model(value: random);

    //navigation to result screen
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.pushNamed(
        context,
        ResultScreen.name,
        //model.imageShow() is the function from Model/model.dart file
        arguments: model.imageShow(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The parent container
      //With all device height and width
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            //linear gradient for better background color
            gradient: LinearGradient(
              colors: [Color(0xff4be4ff), Colors.indigo],
              begin: FractionalOffset(0.5, 0.0),
            ),
          ),
          child: Stack(
            children: <Widget>[
              SafeArea(
                /*
                * The below row contains the iconButton:
                * Which is navigate to guide page
                * where we will guide how to use this app
                * */
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const GuideScreen()));
                        },
                        icon: const Icon(Icons.help_outline),
                        iconSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*
                  * The below container contains the logo of the app.
                  * The image has been taken from images/....
                  * */
                  Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      image: const DecorationImage(
                        image: AssetImage('images/logo1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  /*
                  * The below text widget contains the main text
                  * Here we used constant from Constants/constants.dart file because
                  * That text is a fixed one .
                  * */
                  Text(
                    kHomePageMainText,
                    style: GoogleFonts.merriweather(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 5.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  /*
                  * The below text widget contains the sub text
                  * Here we used constant from Constants/constants.dart file because
                  * That text is a fixed one .
                  * */
                  const Text(
                    kHomePageSubText,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0,
                      color: Colors.white70,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        imageTaskHandler(1);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 5,
                        onPrimary: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      /*
                      *The reusable widget is from Reusable/reusable_button_child.dart file
                      * which contains the child widgets of the elevated button
                      */
                      child: ReusableButtonChilds(
                        label: 'TAKE A PICTURE',
                        iconValue: Icons.camera_alt_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        imageTaskHandler(0);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 5,
                        onPrimary: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                     /*
                     *The reusable widget is from Reusable/reusable_button_child.dart file
                      * which contains the child widgets of the elevated button
                    */
                      child: ReusableButtonChilds(
                        label: 'CHOOSE FROM GALLERY',
                        iconValue: Icons.photo_album_outlined,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
