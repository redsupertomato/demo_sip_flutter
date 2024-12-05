import 'package:flutter/material.dart';

class OngoingCallWidget extends StatelessWidget {
  final String callStatus; // Current call status
  final VoidCallback onTap; // Callback to navigate to the call screen

  OngoingCallWidget({
    required this.callStatus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.blueAccent,
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ongoing Call - $callStatus',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Icon(Icons.phone_in_talk, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
