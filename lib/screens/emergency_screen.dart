import 'package:flutter/material.dart';

class EmergencySOSScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Emergency SOS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SOS Button
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 16),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.red[200],
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                    child: Text(
                      'SOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),

              // Emergency Contacts Section
              Text(
                'Emergency Contacts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 16),
              // First Contact Card
              emergencyContactCard('Nishu Bhaiya', 'Primary Contact'),
              SizedBox(height: 12),
              // Second Contact Card
              emergencyContactCard('Local Police', 'Emergency Services'),

              SizedBox(height: 32),

              // Quick Actions Section
              Text(
                'Quick Actions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 16),
              quickActionButton('Block Current Call', Colors.deepPurple),
              quickActionButton('Send Location', Colors.deepPurple),
              quickActionButton('Record Call', Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }

  Widget emergencyContactCard(String name, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.deepPurple[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[900],
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.deepPurple[700]),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Call action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Call',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quickActionButton(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle Quick Action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
