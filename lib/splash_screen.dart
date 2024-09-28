import 'package:flutter/material.dart';
import 'dart:async';
import 'app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Logo animation controller
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Logo animation (fade in)
    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeIn,
    );

    // Text animation controller
    _textController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Text animation (fade in)
    _textAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    );

    // Start the animations
    _logoController.forward().then((_) {
      _textController.forward();
    });

    // After the animation, navigate to the login page
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _logoAnimation,
              child: Image.asset(
                'assets/images/Dule_Logo-removebg-preview 2.png',  // Replace with your image path
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            FadeTransition(
              opacity: _textAnimation,
              child: Text(
                'DULE',
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
