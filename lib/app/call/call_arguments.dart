import 'package:firebase_messaging/firebase_messaging.dart';

class CallArguments {
  CallArguments({required this.id, required this.callerName});

  factory CallArguments.fromNotification(RemoteMessage remoteMessage) {
    return CallArguments(
      id: remoteMessage.data['id'] as String,
      callerName: remoteMessage.data['callerName'] as String,
    );
  }

  final String id;
  final String callerName;
}
