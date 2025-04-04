import 'package:flutter/material.dart';
import 'package:testproject/widgets/footer_navigation.dart';
import 'package:testproject/screens/community_alerts_screen.dart'; // Import Community Alerts Screen
import 'package:testproject/screens/language_settings_page.dart'; // Import Language Settings Page
import 'package:testproject/screens/analytics_screen.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile & Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/mehak.jpg'), // Placeholder image
              ),
              SizedBox(height: 10),
              Text('John Doe',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text('+1 234 567 890', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
              SettingsSection(title: 'Account Settings', options: [
                SettingsOption(label: 'Edit Profile', onTap: () {}),
                SettingsOption(label: 'Emergency Contacts', onTap: () {}),
              ]),
              SizedBox(height: 20),
              SettingsSection(title: 'Protection Settings', options: [
                SettingsOption(
                  label: 'Statistics and Analysis',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnalyticsScreen()));
                  },
                ),
                SettingsOption(
                  label: 'Community Alerts',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityAlertsScreen()),
                    );
                  },
                ),
              ]),
              SizedBox(height: 20),
              SettingsSection(title: 'Notifications', options: [
                SettingsOption(label: 'Alert Preferences', onTap: () {}),
                SettingsOption(
                  label: 'Language Settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LanguageSettingsPage()),
                    );
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsOption> options;

  SettingsSection({required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ...options,
      ],
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  SettingsOption({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
