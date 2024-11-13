import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/widgets/custom_button.dart';

import 'widgets/get_back.dart';

late final String hintText;
final inputDecoration = InputDecoration(
  hintStyle: const TextStyle(color: Color(0xFF1D1B20)),
  filled: true,
  fillColor: Colors.white.withOpacity(0.2),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  ),
);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D3E3),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 210.0),
              //Welcome back text
              const Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF13315A),
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: inputDecoration.copyWith(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 26),
                    TextFormField(
                      obscureText: _obscureText,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 44),
              //Reset password button
              const SizedBox(height: 43),
              //get back button
              GetBack(
                onTap: () {
                  Get.toNamed('/startingPage');
                },
              ),
              const SizedBox(height: 95.0),
              //LogIn button
              CustomButton(
                onPressed: () {
                  Get.toNamed('/welcome');
                },
                buttonText: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
