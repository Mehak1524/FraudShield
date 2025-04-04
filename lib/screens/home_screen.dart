import 'package:flutter/material.dart';
import 'package:testproject/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.check, color: Colors.white, size: 50),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to FraudShield',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Your AI Powered Call Protection',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: FeatureBulletPoint(
                      text: 'Real-time scam detection', color: Colors.green),
                ),
                Center(
                  child: FeatureBulletPoint(
                      text: 'Voice pattern analysis', color: Colors.yellow),
                ),
                Center(
                  child: FeatureBulletPoint(
                      text: 'Instant alerts and protection', color: Colors.red),
                ),
              ],
            ),
            Spacer(flex: 3),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class FeatureBulletPoint extends StatelessWidget {
  final String text;
  final Color color;

  FeatureBulletPoint({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisSize:
            MainAxisSize.min, // Ensures the row width wraps around the content
        children: [
          Icon(Icons.circle, color: color, size: 12),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
