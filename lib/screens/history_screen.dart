import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testproject/screens/analytics_screen.dart';
import 'package:testproject/screens/community_alerts_screen.dart';
import 'package:testproject/screens/dashboard_screen.dart';
import 'package:testproject/widgets/footer_navigation.dart';

class CallHistoryScreen extends StatefulWidget {
  const CallHistoryScreen({Key? key}) : super(key: key);

  @override
  _CallHistoryScreenState createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  int _currentIndex = 1; // Index for History screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Call History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Filter Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButton<String>(
                  value: 'All Calls',
                  isExpanded: true,
                  underline: Container(),
                  items: <String>[
                    'All Calls',
                    'Blocked Calls',
                    'Safe Calls',
                    'Warnings'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(color: Colors.deepPurple)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ),
              const SizedBox(height: 20.0),
              // Call Cards
              _buildCallCard(
                context,
                'Blocked Call',
                'High Risk',
                Colors.red,
                'Today, 10:30 AM',
              ),
              const SizedBox(height: 16.0),
              _buildCallCard(
                context,
                'Safe Call',
                'Safe',
                Colors.green,
                'Today, 9:15 AM',
              ),
              const SizedBox(height: 16.0),
              _buildCallCard(
                context,
                'Warning Issued',
                'Medium',
                Colors.orange,
                'Yesterday, 2:45 PM',
              ),
              const SizedBox(height: 20.0),
              // Weekly Summary
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Weekly Summary',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      'Total Calls: 23',
                      style:
                          TextStyle(fontSize: 18.0, color: Colors.deepPurple),
                    ),
                    Text(
                      'Blocked: 5',
                      style:
                          TextStyle(fontSize: 18.0, color: Colors.deepPurple),
                    ),
                    Text(
                      'Safe: 18',
                      style:
                          TextStyle(fontSize: 18.0, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.phone),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Tracks the selected tab
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Handle navigation
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
                MaterialPageRoute(
                    builder: (context) => CommunityAlertsScreen()),
              );
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
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

  Widget _buildCallCard(BuildContext context, String title, String riskLevel,
      Color color, String time) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: color,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  time,
                  style:
                      const TextStyle(fontSize: 16.0, color: Colors.deepPurple),
                ),
              ],
            ),
          ),
          Text(
            riskLevel,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
