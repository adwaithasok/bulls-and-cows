import 'package:bull_cow/main.dart';
import 'package:bull_cow/view/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate loading time
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });

    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Bulls and Cows',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
