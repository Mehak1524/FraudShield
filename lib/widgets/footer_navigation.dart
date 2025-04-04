import 'package:flutter/material.dart';
import 'package:testproject/screens/analytics_screen.dart'; // Import Analytics Screen
import 'package:testproject/screens/community_alerts_screen.dart';
import 'package:testproject/screens/dashboard_screen.dart';
import 'package:testproject/screens/history_screen.dart'; // Import Community Alerts Screen

class FooterNavigation extends StatefulWidget {
  @override
  _FooterNavigationState createState() => _FooterNavigationState();
}

class _FooterNavigationState extends State<FooterNavigation> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CallHistoryScreen()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AnalyticsScreen()));
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/assistant');
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommunityAlertsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Color.fromARGB(255, 210, 202, 212),
      backgroundColor: Color.fromARGB(238, 255, 255, 255),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analysis'),
        BottomNavigationBarItem(
            icon: Icon(Icons.assistant), label: 'Assistant'),
        BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'Alert'),
      ],
    );
  }
}
