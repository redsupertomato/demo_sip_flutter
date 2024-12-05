import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  final String callStatus; // Call status (e.g., "Ringing", "Connected", "Ended")
  final String calleeNumber; // Number being called
  final VoidCallback onHangup; // Function to handle hangup action

  CallScreen({
    required this.callStatus,
    required this.calleeNumber,
    required this.onHangup,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calling $calleeNumber',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Status: $callStatus',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: onHangup,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text('Hangup', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
