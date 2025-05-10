import 'package:flutter/material.dart';
import 'package:freshcart/AuthFile/LoginPage.dart';
import 'package:freshcart/Home/Home.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formKey = GlobalKey<FormState>(); // Form Key for Validation

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 252), // Light grey background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns content to left
            children: [
              const SizedBox(height: 40),
              
              // Title Aligned to Left
              const Text(
                "Welcome to Our \nGrocery Shop",
                textAlign: TextAlign.left, // Aligns text to left
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 20), // More space before form

              // Sign-Up Card
              Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    key: _formKey, // Assign form key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Full Name Field
                        _buildTextField(Icons.person, "Full Name", _nameController, (value) {
                          if (value!.isEmpty) {
                            return "Please enter your full name";
                          }
                          return null;
                        }),
                        const SizedBox(height: 20),

                        // Email Field
                        _buildTextField(Icons.email, "Email", _emailController, (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        }),
                        const SizedBox(height: 20),

                        // Password Field
                        _buildTextField(Icons.lock, "Password", _passwordController, (value) {
                          if (value!.isEmpty) {
                            return "Please enter a password";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        }, isPassword: true),
                        const SizedBox(height: 20),

                        // Confirm Password Field
                        _buildTextField(Icons.lock, "Confirm Password", _confirmPasswordController, (value) {
                          if (value!.isEmpty) {
                            return "Please confirm your password";
                          } else if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        }, isPassword: true),
                        const SizedBox(height: 30),

                        // Sign-Up Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If all fields are valid, proceed with sign-up
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Signing up...")),
                                );
                                Home();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // OR Divider
                        Row(
                          children: const [
                            Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("OR", style: TextStyle(color: Colors.grey)),
                            ),
                            Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Google Sign-Up Button
                        _buildGoogleButton(),

                        const SizedBox(height: 20),

                        // Already have an account? Login
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Loginpage()),
                            );
                          },
                          child: const Center(
                            child: Text(
                              "Already have an account? Login",
                              style: TextStyle(color: Colors.green, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable TextField Widget with Validation
  Widget _buildTextField(IconData icon, String label, TextEditingController controller, String? Function(String?)? validator, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.green,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: Icon(icon, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  // Google Sign-Up Button
  Widget _buildGoogleButton() {
    return GestureDetector(
      onTap: () {
        // Handle Google sign-up action
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black54, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/google.png", height: 24), // Google icon
            const SizedBox(width: 10),
            const Text(
              "Sign Up with Google",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
