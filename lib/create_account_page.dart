// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/get_back.dart';

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

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  //text editing controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  late final String hintText;
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D3E3),
      body: ListView(shrinkWrap: true, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 93.0),
              //Hello text
              const Text(
                'Hello!',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF13315A),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Let\'s start a new account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF13315A),
                ),
              ),
              const SizedBox(height: 65.0),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: inputDecoration.copyWith(
                        hintText: 'Username',
                      ),
                      controller: _usernameController,
                    ),
                    const SizedBox(height: 26.0),
                    TextFormField(
                      decoration: inputDecoration.copyWith(
                        hintText: 'Email',
                      ),
                      controller: _emailController,
                    ),
                    const SizedBox(height: 26.0),
                    TextFormField(
                      controller: _passwordController,
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
              const SizedBox(height: 50.0),

              //get back button
              GetBack(
                onTap: () {
                  Get.toNamed('/startingPage');
                },
              ),
              const SizedBox(height: 50.0),
              //Next page button
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed('/welcome');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(113.0, 60.0),
                        maximumSize: const Size(114.0, 61.0),
                        backgroundColor: const Color(0xFF13315A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 6,
                      ),
                      icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.white),
                      label: const Text(
                        'Next',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
