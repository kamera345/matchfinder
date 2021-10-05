import 'package:flutter/material.dart';
import 'package:matchfinder/Constants/constants.dart';
import 'package:matchfinder/Screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

/*
* In this page we display the result after processing
*We have title and sub title texts
* And we have the result like match or no match
* And we have a floating action button to navigate back to homepage
*
* And we are using google fonts package for fonts
* */

class ResultScreen extends StatelessWidget {
  // ResultScreen({required this.value, required this.text});
  static const String name ='result_screen';

  const ResultScreen({Key? key}) : super(key: key);

  // final value;
  // final text;



  @override
  Widget build(BuildContext context) {

    // we require values to display
    // The value is a dynamic object from which comes from model
    final dynamic value = ModalRoute.of(context)!.settings.arguments;

    //var value = Random().nextInt(10);

    return Scaffold(
      /*
      * Here we are using a floating action button
      * Which we use to navigate back to home page
      * */
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.pushNamed(context, HomePage.name);
        },
        child: const Icon(Icons.arrow_back_outlined),
      ),
      body: Container(
        //This means the whole device width and height
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Color(0xff4be4ff),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.indigo],
            begin: FractionalOffset(0.0, 1.0),
          ),
        ),
        child: Column(
          children:<Widget>[
            Padding(
              padding:const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0, bottom: 10.0),
                    child: Text('MIRINO', style: GoogleFonts.merriweather(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 2.0,
                    ),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text('SMART WAY TO FIND UNKNOWN', style:kResultPageSubTextStyle),
                  ),
                ],
              ),
            ),

            /*
            * The below is the result display space
            * we are extracting the object we got and displaying here
            * */
            Padding(
              padding:const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children:<Widget>[
                  Padding(
                    padding:const EdgeInsets.only(top: 100.0),
                    child: Container(
                      height: 210.0,
                      width: 210.0,
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.white, width: 5.0),
                        image: DecorationImage(
                          image: AssetImage('images/${value['image']}.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                   const SizedBox(height: 30.0,),
                  Text(value['text'], style: GoogleFonts.playfairDisplay(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

