import 'package:sip_ua/sip_ua.dart';

class SIPService implements SIPUAListener {
  late SIPUAHelper _sipHelper;

  SIPService() {
    _sipHelper = SIPUAHelper();
    _sipHelper.addSipUaListener(this);
  }

  void configureSIP(String wsUrl, String uri, String username, String password) {
    UaSettings settings = UaSettings();

    settings.webSocketUrl = wsUrl; // WebSocket URL for your SIP server
    settings.uri = uri; // SIP URI
    settings.authorizationUser = username;
    settings.password = password;
    settings.displayName = username;
    settings.userAgent = 'Flutter SIP Client';

    _sipHelper.start(settings);
  }

  void makeCall(String targetNumber) {
    _sipHelper.call(targetNumber, false); // `false` for audio-only calls
  }

  void hangup() {
    _sipHelper.hangup();
  }

  @override
  void callStateChanged(Call call, CallState state) {
    print('Call state: ${state.state}');
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    print('Registration state: ${state.state}');
  }

  @override
  void transportStateChanged(TransportState state) {
    print('Transport state: ${state.state}');
  }

  SIPUAHelper get helper => _sipHelper;
}
