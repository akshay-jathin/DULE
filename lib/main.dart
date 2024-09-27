import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_routes.dart';  
import 'login_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';
import 'forgot_password_screen.dart';  // Import this if it's in a different file

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DULE',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onUnknownRoute: (settings) {
        // Handle unknown routes if needed
        return MaterialPageRoute(builder: (context) => NotFoundScreen());
      },
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('404')),
      body: Center(child: Text('Page not found')),
    );
  }
}