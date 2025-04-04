import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // File Picker for attachments

class ReportScamScreen extends StatefulWidget {
  const ReportScamScreen({Key? key}) : super(key: key);

  @override
  _ReportScamScreenState createState() => _ReportScamScreenState();
}

class _ReportScamScreenState extends State<ReportScamScreen> {
  String? selectedScamType;
  bool isOtherScam = false;
  String? customScamType;
  String? uploadedFileName;

  @override
  Widget build(BuildContext context) {
    const String phoneNumber = '+1 (555) 123-4567';
    const String dateTime = 'Jan 19, 2025 10:30 AM';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Scam Call'),
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
              _buildInfoSection(
                title: 'Call Information',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoItem('Phone Number', phoneNumber),
                    _buildInfoItem('Date & Time', dateTime),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              _buildInfoSection(
                title: 'Scam Type',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        _buildScamTypeChip('Banking Scam'),
                        _buildScamTypeChip('Tech Support Fraud'),
                        _buildScamTypeChip('Other (Specify Below)'),
                      ],
                    ),
                    if (isOtherScam) const SizedBox(height: 16.0),
                    if (isOtherScam)
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Specify Scam Type',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          customScamType = value;
                        },
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              _buildInfoSection(
                title: 'Description',
                child: const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Describe what happened...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              _buildInfoSection(
                title: 'Attachments',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _pickFile,
                      icon: const Icon(Icons.attach_file),
                      label: const Text('Add Call Recording'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[100],
                        foregroundColor: Colors.deepPurple[900],
                      ),
                    ),
                    if (uploadedFileName != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Uploaded File: $uploadedFileName',
                          style: const TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                    String selectedType = isOtherScam
                        ? (customScamType ?? 'Other')
                        : selectedScamType ?? 'None';
                    print('Scam Type: $selectedType');
                    print('File Uploaded: $uploadedFileName');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'Submit Report',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
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
          const SizedBox(height: 16.0),
          child,
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _buildScamTypeChip(String type) {
    bool isSelected = selectedScamType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedScamType = type;
          isOtherScam = type == 'Other (Specify Below)';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple : Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          type,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.white : Colors.deepPurple,
          ),
        ),
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        uploadedFileName = result.files.single.name;
      });
    }
  }
}
