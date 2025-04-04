import 'package:flutter/material.dart';
import 'package:testproject/screens/home_screen.dart';
import 'package:testproject/screens/dashboard_screen.dart';

void main() {
  runApp(FraudShieldApp());
}

class FraudShieldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FraudShield',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'GoogleFonts.lato().fontFamily',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
