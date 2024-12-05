import 'package:flutter/material.dart';
import 'screens/sip_settings_screen.dart';
import 'screens/dial_pad_screen.dart';
import 'services/sip_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SIPService sipService = SIPService();

    return MaterialApp(
      title: 'Flutter SIP App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SIPSettingsScreen(sipService),
      routes: {
        '/dial-pad': (context) => DialPadScreen(sipService),
      },
    );
  }
}
