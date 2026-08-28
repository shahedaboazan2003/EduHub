import 'package:flutter/material.dart';

import 'dart:async';

import 'onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 15), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              width: 96,
              height: 96,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16),

                // border-radius: 16px
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 96,
                height: 96,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'EduHub',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xff004AC6),
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: 192,
              height: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9999),
                child: const LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1B61EB)),
                  backgroundColor: Color(0xffE1E3E4),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Loading...',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 12,
                color: Color(0xff565E74),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
