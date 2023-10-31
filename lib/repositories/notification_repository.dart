import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:uuid/uuid.dart';
import 'package:voip_calling/app/app_router.dart';

Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  await handleMessage(message);
}

Future<void> handleMessage(RemoteMessage message) async {
  if (message.data['type'] == 'incoming_call') {
    await FlutterCallkitIncoming.showCallkitIncoming(
      CallKitParams(
        id: const Uuid().v4(),
        textAccept: 'Accept',
        textDecline: 'Decline',
        handle: 'Touchcom AS',
        duration: 30000,
        android: const AndroidParams(
          incomingCallNotificationChannelName: 'calling',
          isCustomNotification: true,
        ),
        missedCallNotification: const NotificationParams(
          showNotification: false,
          isShowCallback: false,
        ),
        nameCaller: 'John Smith',
      ),
    );
  }
}

Future<void> listenToIncomingCalls() async {
  FlutterCallkitIncoming.onEvent.listen((callEvent) async {
    final event = callEvent?.event;
    log('incoming event: $event');
    if (event == null) {
      return;
    }

    switch (event) {
      case Event.actionDidUpdateDevicePushTokenVoip:
        await _handleVoipTokenUpdate();
      case Event.actionCallIncoming:
        await _handleIncomingCall(callEvent);
      case Event.actionCallAccept:
        await _handleCallAccepted(callEvent);
      case Event.actionCallDecline:
        await _handleCallDeclined(callEvent);
      case Event.actionCallEnded:
        await _handleCallEnded(callEvent);
      case Event.actionCallTimeout:
        await _handleCallEnded(callEvent);
      case Event.actionCallCallback:
      case Event.actionCallToggleHold:
      case Event.actionCallStart:
      case Event.actionCallToggleMute:
      case Event.actionCallToggleDmtf:
      case Event.actionCallToggleGroup:
      case Event.actionCallToggleAudioSession:
      case Event.actionCallCustom:
    }
  });
}

Future<void> _handleCallEnded(CallEvent? callEvent) async {
  log('handleCallEnded');
}

Future<void> _handleCallDeclined(CallEvent? callEvent) async {
  log('handleCallDeclined');
}

Future<void> _handleCallAccepted(CallEvent? callEvent) async {
  log('handleCallAccepted');
}

Future<void> _handleIncomingCall(CallEvent? callEvent) async {
  log('handleIncomingCall');
}

Future<void> _handleVoipTokenUpdate() async {
  await FlutterCallkitIncoming.getDevicePushTokenVoIP()
      .then((value) => log('VoIP PushToken $value'));
}

class NotificationRepository {
  NotificationRepository({required this.appRouter});

  final AppRouter appRouter;

  Future<void> initializeFirebaseMessaging() async {
    await listenToIncomingCalls();
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    await FirebaseMessaging.instance.getInitialMessage().then((initialMessage) {
      if (initialMessage != null) {
        handleMessage(initialMessage);
      }
    });
    await FirebaseMessaging.instance
        .getToken()
        .then((value) => log('FCM token: $value'));
    FirebaseMessaging.instance.onTokenRefresh.listen((value) {
      log('FCM token refreshed: $value');
    });
  }
}
