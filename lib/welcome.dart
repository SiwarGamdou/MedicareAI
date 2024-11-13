import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100.0),
            const Text(
              'Hi Mike,',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF13315A),
              ),
            ),
            Image.asset(
              'assets/doc.png',
              width: 300.0,
              height: 300.0,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF13315A),
              ),
            ),
            const Text(
              'to MedicalCare AI chatbot!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF13315A),
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Whether you need to find the right doctor or get some advice, we\'re \n here to help.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF13315A),
                ),
              ),
            ),
            const SizedBox(height: 45.0),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/Chatroom');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(267.0, 61.0),
                maximumSize: const Size(268.0, 62.0),
                foregroundColor: const Color(0xFF13315A),
                backgroundColor: const Color(0xFFC6D3E3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 6,
              ),
              child: const Text(
                'Start',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
