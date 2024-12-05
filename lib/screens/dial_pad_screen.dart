import 'package:flutter/material.dart';
import '../services/sip_service.dart';
import '../widgets/ongoing_call_widget.dart';
import 'call_screen.dart';

class DialPadScreen extends StatefulWidget {
  final SIPService sipService;

  DialPadScreen(this.sipService);

  @override
  _DialPadScreenState createState() => _DialPadScreenState();
}

class _DialPadScreenState extends State<DialPadScreen> {
  final TextEditingController _numberController = TextEditingController();
  String _callStatus = ""; // Track the status of the ongoing call
  bool _isCallOngoing = false; // Flag to show/hide the ongoing call widget

  // To initiate the call
  void _call() {
    widget.sipService.makeCall(_numberController.text);
    setState(() {
      _callStatus = "Ringing";
      _isCallOngoing = true;
    });
  }

  // To hang up the call
  void _hangup() {
    widget.sipService.hangup();
    setState(() {
      _callStatus = "Ended";
      _isCallOngoing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dial Pad')),
      body: Column(
        children: [
          if (_isCallOngoing)
            OngoingCallWidget(
              callStatus: _callStatus,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallScreen(
                      callStatus: _callStatus,
                      calleeNumber: _numberController.text,
                      onHangup: _hangup,
                    ),
                  ),
                );
              },
            ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _numberController,
                    decoration: InputDecoration(
                      labelText: 'Enter Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _call,
                    child: Text('Call'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
