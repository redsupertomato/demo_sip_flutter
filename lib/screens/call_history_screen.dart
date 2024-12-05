import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/call_history_model.dart';

class CallHistoryScreen extends StatelessWidget {
  Future<List<CallHistory>> _getCallHistory() async {
    final box = await Hive.openBox<CallHistory>('call_history');
    return box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call History')),
      body: FutureBuilder<List<CallHistory>>(
        future: _getCallHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No call history found.'));
          }

          final callHistory = snapshot.data!;
          return ListView.builder(
            itemCount: callHistory.length,
            itemBuilder: (context, index) {
              final call = callHistory[index];
              return ListTile(
                title: Text(call.number),
                subtitle: Text('${call.type} - ${call.timestamp}'),
              );
            },
          );
        },
      ),
    );
  }
}
