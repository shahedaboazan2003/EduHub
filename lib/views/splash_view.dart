import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:async';

import '../providers/app_provider.dart';
import '../widgets/main_navigation_bar.dart';
import 'home_view.dart';
import 'login_view.dart';
import 'onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppProvider>().checkAppState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        if (!appProvider.isLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (appProvider.showOnboarding) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OnboardingView()),
              );
            } else if (appProvider.isLoggedIn) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainNavigationBar()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            }
          });
        }
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
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
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
                SizedBox(height: 32),

                SizedBox(
                  width: 192,
                  height: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9999),
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF004AC6),
                      ),
                      backgroundColor: Color(0xffE1E3E4),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Loading...',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xff565E74),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
