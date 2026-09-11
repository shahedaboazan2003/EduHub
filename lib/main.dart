import 'package:provider/provider.dart';

import 'core/storage/app_preferences.dart';
import 'core/storage/secure_session_storage.dart';
import 'providers/app_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/course_provider.dart';
import 'providers/user_provider.dart';
import 'repos/auth_repository.dart';

import 'package:flutter/material.dart';

import 'core/config/di.dart';
import 'repos/course_repository.dart';
import 'repos/user_repository.dart';
import 'views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  final session = await getIt<SecureSessionStorage>().getSession();

  print('MY TOKEN: ${session?.token}');
  // await getIt<AppPreferences>().resetOnboarding();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(authRepository: getIt<AuthRepository>()),
        ),
        ChangeNotifierProvider(
          create: (_) => AppProvider(
            appPreferences: getIt<AppPreferences>(),
            secureSessionStorage: getIt<SecureSessionStorage>(),
            authRepository: getIt<AuthRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(userRepository: getIt<UserRepository>()),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              CourseProvider(courseRepository: getIt<CourseRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
