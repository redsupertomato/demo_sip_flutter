import 'package:flutter/material.dart';
import '../services/sip_service.dart';

class SIPSettingsScreen extends StatefulWidget {
  final SIPService sipService;

  SIPSettingsScreen(this.sipService);

  @override
  _SIPSettingsScreenState createState() => _SIPSettingsScreenState();
}

class _SIPSettingsScreenState extends State<SIPSettingsScreen> {
  final TextEditingController _wsUrlController = TextEditingController();
  final TextEditingController _uriController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _saveSettings() {
    widget.sipService.configureSIP(
      _wsUrlController.text,
      _uriController.text,
      _usernameController.text,
      _passwordController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SIP configured!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SIP Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _wsUrlController,
              decoration: InputDecoration(labelText: 'WebSocket URL'),
            ),
            TextField(
              controller: _uriController,
              decoration: InputDecoration(labelText: 'SIP URI'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveSettings,
              child: Text('Save & Connect'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dial-pad');
              },
              child: Text('Go to Dial Pad'),
            ),
          ],
        ),
      ),
    );
  }
}
