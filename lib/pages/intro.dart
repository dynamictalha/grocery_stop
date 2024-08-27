import 'package:flutter/material.dart';
import 'package:fruitstore/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          
          // logo
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 80,bottom: 40,top: 60),
            child: Image.asset('images/avocado.png'),
          ),


          //We deliver groceries at the doorstep
         Padding(
            padding:  EdgeInsets.all(24),
            child:  Text("We deliver groceries at the doorstep",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ) ),
          ),

          // fresh item everyday
          Text("Fresh item everyday",
          style: TextStyle(color: Colors.grey),),

          // get start button
          const Spacer(),
          GestureDetector(
            onTap: ()=> Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context)=> const HomePage())),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 149, 220, 57),
                borderRadius: BorderRadius.circular(12)
              ),
              padding: EdgeInsets.all(20),
              child: Text("Get Started",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ),
          const Spacer(),
        ],
      ),

    );
  }
}