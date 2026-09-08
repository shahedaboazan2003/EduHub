import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'repos/auth_repository.dart';
import 'views/login_view.dart';

import 'package:flutter/material.dart';

import 'core/config/di.dart';
import 'views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(authRepository: getIt<AuthRepository>()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginView());
  }
}
