import 'package:flutter/material.dart';
import 'package:settings/forgot_password_screen.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

class AppRoutes {
  static const String initialRoute = '/login';

  static final routes = {
    '/login': (context) => LoginScreen(),
    '/home': (context) => HomeScreen(),
    '/settings': (context) => SettingsScreen(),
    '/forgot-password': (context) => ForgotPasswordScreen(),  // Ensure leading slash
  };
}

