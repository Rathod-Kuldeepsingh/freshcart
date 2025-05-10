import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freshcart/Home/Home.dart';
import 'package:freshcart/Startpage/Startedpage.dart';
import 'package:freshcart/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;


   final List<Map<String, String>> _onboardingData = [
    
    {
      "animation": "asset/onscreen1.json",
      "title": "Welcome to FreshCart",
      "subtitle": "Order Groceries anytime,anywhere",
    },
    {
      "animation": "asset/discount.json",
      "title": "Amazing Discount & Offers",
      "subtitle": "Save More,Shop More",
    },
    {
      "animation": "asset/delivery.json",
      "title": "Delivery in 30 Min",
      "subtitle": "Fast,Fresh,Fabulous",
    },
    
  ];
  void _onNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen()
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  final data = _onboardingData[index];
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Lottie.asset(
                          data["animation"]!,
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          data["title"]!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _onboardingData.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xFFE3F0AF),
                dotColor: Colors.green,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 6,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ElevatedButton(
                onPressed: _onNext,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal:30, vertical: 26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.green,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(FontAwesomeIcons.arrowRight,color: Colors.white,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}