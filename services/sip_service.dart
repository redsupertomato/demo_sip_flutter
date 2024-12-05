import 'package:sip_ua/sip_ua.dart';

class SIPService implements SIPUAListener {
  late SIPUAHelper _sipHelper;

  SIPService() {
    _sipHelper = SIPUAHelper();
    _sipHelper.addSipUaListener(this);
  }

  void configureSIP(String wsUrl, String uri, String username, String password) {
    UaSettings settings = UaSettings();

    settings.webSocketUrl = wsUrl; // WebSocket URL
    settings.uri = uri;           // SIP URI (e.g., sip:username@domain)
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
    // Handle call state changes, such as "ringing", "answered", "ended"
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    // Handle SIP registration state
  }

  @override
  void transportStateChanged(TransportState state) {
    // Handle WebSocket transport state
  }

  SIPUAHelper get helper => _sipHelper;
}
