import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class LanguageSettingsPage extends StatefulWidget {
  @override
  _LanguageSettingsPageState createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  Map<String, String> _localizedStrings = {};
  String _currentLanguage = 'en';
  bool _isAutoDetectOn = true;

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    String jsonString =
        await rootBundle.loadString('assets/languages/$_currentLanguage.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    setState(() {
      _localizedStrings =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
    });
  }

  void _changeLanguage(String languageCode) {
    setState(() {
      _currentLanguage = languageCode;
      _loadLanguage();
    });
  }

  String _getCurrentLanguageDisplayName() {
    switch (_currentLanguage) {
      case 'hi':
        return 'हिन्दी';
      case 'mr':
        return 'मराठी';
      default:
        return 'English (US)';
    }
  }

  Widget _buildLanguageOption(
      String language, String languageCode, String status) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.deepPurple[50],
      child: ListTile(
        title: Text(language, style: TextStyle(color: Colors.deepPurple[800])),
        subtitle: Text(status),
        trailing: _currentLanguage == languageCode
            ? Text(
                _localizedStrings['active'] ?? 'Active',
                style: TextStyle(color: Colors.deepPurple),
              )
            : null,
        onTap: () => _changeLanguage(languageCode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_localizedStrings['title'] ?? 'Language Settings'),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _localizedStrings['current_language'] ?? 'Current Language',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _getCurrentLanguageDisplayName(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 16),
              Text(
                _localizedStrings['choose_language'] ?? 'Choose Language',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(height: 8),
              _buildLanguageOption(
                _localizedStrings['english'] ?? 'English',
                'en',
                'US',
              ),
              _buildLanguageOption(
                _localizedStrings['hindi'] ?? 'Hindi',
                'hi',
                'Hindi',
              ),
              _buildLanguageOption(
                _localizedStrings['marathi'] ?? 'Marathi',
                'mr',
                'Marathi',
              ),
              SizedBox(height: 20),
              Divider(color: Colors.deepPurple),
              SizedBox(height: 16),
              Text(
                _localizedStrings['voice_recognition'] ?? 'Voice Recognition',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _localizedStrings['supports'] ??
                      'Supports real-time detection in 20+ languages',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                ),
              ),
              ListTile(
                title: Text(
                  _localizedStrings['auto_detect_language'] ??
                      'Auto-Detect Language',
                  style: TextStyle(color: Colors.deepPurple),
                ),
                trailing: Switch(
                  value: _isAutoDetectOn,
                  activeColor: Colors.deepPurple,
                  onChanged: (bool value) {
                    setState(() {
                      _isAutoDetectOn = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'Analysis'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant), label: 'Assistant'),
        ],
      ),
    );
  }
}
