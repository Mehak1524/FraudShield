import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs
import 'package:testproject/widgets/footer_navigation.dart';

class LearnStaySafeScreen extends StatelessWidget {
  const LearnStaySafeScreen({Key? key}) : super(key: key);

  final String commonScamTypesUrl =
      'https://www.yrp.ca/en/crime-prevention/resources/Little-Black-Book-Scams-e.pdf';
  final String safetyTipsUrl =
      'https://www.mass.gov/news/tips-to-protect-yourself-from-phishing-scams';
  final String interactiveTutorialUrl =
      'https://www.youtube.com/watch?v=4C3PecVKu08&ab_channel=MiacademyLearningChannel';

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Learn & Stay Safe'),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recent Scam Trends
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Scam Trends',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildTrendRow('Crypto Investment Scams ↑ 25%', Colors.red,
                        Icons.circle),
                    _buildTrendRow('Bank Verification Fraud ↑ 15%',
                        Colors.orange, Icons.diamond),
                    _buildTrendRow(
                        'Lottery/Prize Scams ↓ 5%', Colors.blue, Icons.circle),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              // Safety Guides
              const Text(
                'Safety Guides',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              const SizedBox(height: 8.0),
              _buildSafetyGuideCard(
                'Common Scam Types',
                'Learn to identify different scams',
                Colors.deepPurple[100] ?? Colors.deepPurple,
                () => _launchURL(commonScamTypesUrl),
              ),
              _buildSafetyGuideCard(
                'Safety Tips',
                'Essential protection guidelines',
                Colors.green[100] ?? Colors.green,
                () => _launchURL(safetyTipsUrl),
              ),
              _buildSafetyGuideCard(
                'Interactive Tutorial',
                'Practice with simulated calls',
                Colors.blue[100] ?? Colors.blue,
                () => _launchURL(interactiveTutorialUrl),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }

  Widget _buildTrendRow(String text, Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: const TextStyle(color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyGuideCard(
      String title, String subtitle, Color color, Function onPressed) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.deepPurple),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.deepPurple),
        ),
        trailing: ElevatedButton(
          onPressed: () => onPressed(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Start', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
