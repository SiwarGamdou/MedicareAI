import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/widgets/round_button.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D3E3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Center  vertically
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        Colors.primaries[2 % Colors.primaries.length],
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'username',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              RoundButton(
                onPressed: () {
                  Get.toNamed('/startingPage');
                },
                buttonText: 'Log out',
                hasIcon: true,
                icon: const Icon(Icons.logout_outlined,
                    size: 30.0, color: Colors.white),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Support',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF13315A),
                  ),
                ),
              ),
              const SizedBox(height: 200),
              Image.asset(
                'assets/logo.png',
                width: 150.0,
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
