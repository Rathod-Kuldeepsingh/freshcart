// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freshcart/Home/Home.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _isVisible = false; // Visibility toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 252),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: const Color.fromARGB(255, 118, 214, 120),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        FontAwesomeIcons.cartShopping,
                        color: Colors.white,
                        size: 59,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "Welcome to our",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                "FreshCart",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          // Email TextField
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              cursorColor: Colors.green,
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                labelText: 'Email',
                 prefixIcon: Icon(FontAwesomeIcons.person, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),

          // Password TextField with suffixIcon
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              cursorColor: Colors.green,
              obscureText: !_isVisible, // Hide/show password
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black),
                fillColor: Colors.white.withOpacity(0.1),
                 prefixIcon: Icon(FontAwesomeIcons.lock, color: Colors.black),
                filled: true,
                
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: Icon(
                    _isVisible
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    color: Colors.black,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 220),
            child: Column(
              children: [
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.green; // Color when pressed
                        }
                        return Color.fromARGB(255, 253, 252, 252); // Default color
                      },
                    )),
                    onPressed: () {},
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ))
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                Navigator.pushNamed(context, "/signup1");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors
                            .green.shade700; // Darker green when pressed
                      }
                      return Colors.green; // Default color
                    },
                  ),
                  shadowColor: WidgetStateProperty.all<Color>(
                      Colors.black26), // Shadow effect
                  elevation: WidgetStateProperty.all<double>(6), // Lift effect
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // Padding inside button
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              
            },
            child: Container(
              height: 40,
              width: 200, // Adjust width
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 252, 252), // Background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
                border: Border.all(
                  width: 1, // Outline thickness
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "asset/google.png",
                    height: 24, // Adjust size
                    width: 24,
                  ),
                  SizedBox(width: 10), // Space between icon and text
                  Text(
                    "Login with Google",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {
                   Navigator.pushNamed(context, "/sign");
                },
                child: Text(
                  'Create new account?',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
