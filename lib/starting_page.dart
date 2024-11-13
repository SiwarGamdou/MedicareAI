import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/widgets/round_button.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D3E3), // Background color
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Logo image
              Image.asset(
                'assets/logo.png',
                width: 300.0,
                height: 300.0,
              ),

              const SizedBox(
                  height: 20.0), // Add spacing between logo and buttons

              // Column for buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Login Button
                  RoundButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    buttonText: 'Login',
                    hasIcon: true,
                    icon: const Icon(Icons.login_outlined,
                        size: 30.0, color: Colors.white),
                  ),

                  const SizedBox(height: 34.0), // Add spacing between buttons

                  // Create Account Button
                  GestureDetector(
                    onTap: () {
                      // Functionality for Create Account
                      Get.toNamed('/createAccount');
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF13315A),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
