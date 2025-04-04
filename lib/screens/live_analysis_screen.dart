import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class ScamDetectReportScreen extends StatelessWidget {
  final String scamRiskLevel =
      'High'; // Can be 'Safe', 'Likely Spam', or 'High'

  @override
  Widget build(BuildContext context) {
    Color riskColor = _getRiskColor(scamRiskLevel);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Live Analysis Report'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Call Analysis Summary Box
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: riskColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Call Analysis Summary',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text('Date: ${DateFormat.yMMMd().format(DateTime.now())}'),
                    const Text('Duration: 2:45'),
                    Text(
                      'Risk Level: $scamRiskLevel',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: riskColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              // Detected Patterns Box
              _buildSectionBox(
                title: 'Detected Patterns',
                color: Colors.deepPurple[50]!,
                children: [
                  _buildDetectedPatternRow('Social Engineering Tactics'),
                  _buildDetectedPatternRow('Urgency Creation'),
                  _buildDetectedPatternRow('Financial Information Request'),
                ],
              ),
              const SizedBox(height: 20.0),
              // Voice Analysis Box
              _buildSectionBox(
                title: 'Voice Analysis',
                color: Colors.deepPurple[50]!,
                children: [
                  _buildVoiceAnalysisRow('Stress Indicators: High'),
                  _buildVoiceAnalysisRow('Background Noise: Call Center'),
                  _buildVoiceAnalysisRow('Voice Pattern: Matched Database'),
                ],
              ),
              const SizedBox(height: 20.0),
              // Actions Section
              const Text(
                'Actions',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8.0),
              // Actions Buttons
              _buildActionsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRiskColor(String riskLevel) {
    switch (riskLevel) {
      case 'High':
        return Colors.red;
      case 'Likely Spam':
        return Colors.orange;
      case 'Safe':
      default:
        return Colors.green;
    }
  }

  Widget _buildSectionBox({
    required String title,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
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
          ...children,
        ],
      ),
    );
  }

  Widget _buildDetectedPatternRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }

  Widget _buildVoiceAnalysisRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }

  Widget _buildActionsSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Block Number action
              },
              child: const Text('Block Number'),
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // Report to Authorities action
              },
              child: const Text(
                'Report to Authorities',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
