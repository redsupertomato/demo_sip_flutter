import 'package:hive/hive.dart';

part 'call_history_model.g.dart';

@HiveType(typeId: 0)
class CallHistory {
  @HiveField(0)
  final String number;

  @HiveField(1)
  final String type; // incoming, outgoing, missed

  @HiveField(2)
  final DateTime timestamp;

  CallHistory(this.number, this.type, this.timestamp);
}
