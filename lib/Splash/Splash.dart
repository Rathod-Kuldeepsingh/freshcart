// ignore_for_file: camel_case_types, use_build_context_synchronously, unused_import

import 'package:flutter/material.dart';
import 'package:freshcart/Onboarding/Onboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {



   @override
  void initState() {
    super.initState();
   _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Onboard()));
  }

  @override
  Widget build(BuildContext context) {
   // Get screen height

    return Scaffold(
      backgroundColor: Color(0xFF40AA54),
      body: SafeArea(
        child: Center(
            child: Container(
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center, // Center the content
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                     padding: const EdgeInsets.all(40.0),
                     child: Image.asset('asset/app_logo.png',),
                   ),
                  Center(
                    child: Text('FreshCart',
                        style: GoogleFonts.leckerliOne(
                          textStyle: TextStyle(fontSize: 35,
                          color: Colors.white),
                        ),),
                    
                  ),
                  Center(
                    child: Text('Your daily needs',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                        ),),
                    
                  ),
                   Column(
                    children: [
                      SizedBox(
                       height: 90, 
                      child: Center(child:
                     Lottie.asset('asset/abc.json')))
                    ],
                   )
                  
                ],
              ),
            ),
          ),
        ),
    );
  }
}