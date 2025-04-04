import 'package:flutter/material.dart';
import 'package:testproject/screens/analytics_screen.dart';
import 'package:testproject/screens/dashboard_screen.dart';
import 'package:testproject/screens/history_screen.dart';
import 'package:testproject/screens/user_profile_screen.dart';
import 'package:testproject/screens/scam_report_screen.dart'; // Import the Report Scam Screen
import 'package:testproject/widgets/footer_navigation.dart';

class CommunityAlertsScreen extends StatefulWidget {
  const CommunityAlertsScreen({Key? key}) : super(key: key);

  @override
  _CommunityAlertsScreenState createState() => _CommunityAlertsScreenState();
}

class _CommunityAlertsScreenState extends State<CommunityAlertsScreen> {
  int _currentIndex = 4;
  bool pushNotifications = true;
  String areaCoverage = '5 miles';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Community Alerts'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_pin, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    Text(
                      'Showing alerts for: New York Area',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[900]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Recent Alerts',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              alertCard(
                context,
                'Bank Verification Scam',
                'Multiple reports in Brooklyn area',
                '2 hours ago',
                Colors.deepPurple[50]!,
                Colors.deepPurple,
              ),
              const SizedBox(height: 12),
              alertCard(
                context,
                'Tech Support Scam',
                'Multiple reports in Manhattan',
                '5 hours ago',
                Colors.deepPurple[50]!,
                Colors.orange,
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReportScamScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    child: Text(
                      'Report New Scams',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Alerts Settings',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Push Notifications',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                  Switch(
                    value: pushNotifications,
                    activeColor: Colors.deepPurple,
                    onChanged: (value) {
                      setState(() {
                        pushNotifications = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Area Coverage',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                  DropdownButton<String>(
                    value: areaCoverage,
                    items:
                        ['1 mile', '5 miles', '10 miles'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        areaCoverage = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
              break;
            case 1:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CallHistoryScreen()));
              break;
            case 2:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AnalyticsScreen()));
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/assistant');
              break;
            case 4:
              // Stay on the current screen
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assistant),
            label: 'Assistant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Alert',
          ),
        ],
      ),
    );
  }

  Widget alertCard(BuildContext context, String title, String subtitle,
      String time, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.error, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[800]),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
