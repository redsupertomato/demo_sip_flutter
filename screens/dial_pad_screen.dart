import 'package:flutter/material.dart';
import '../services/sip_service.dart';

class DialPadScreen extends StatefulWidget {
  final SIPService sipService;

  DialPadScreen(this.sipService);

  @override
  _DialPadScreenState createState() => _DialPadScreenState();
}

class _DialPadScreenState extends State<DialPadScreen> {
  final TextEditingController _numberController = TextEditingController();

  void _call() {
    widget.sipService.makeCall(_numberController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dial Pad')),
      body: Column(
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
    );
  }
}
