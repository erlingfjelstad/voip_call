import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voip_calling/app/app_router.dart';
import 'package:voip_calling/l10n/l10n.dart';
import 'package:voip_calling/repositories/notification_repository.dart';

const notificationPortName = 'notification_port';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  late final AppRouter appRouter;
  late final NotificationRepository notificationRepository;
  late final ReceivePort receivePort;

  @override
  void initState() {
    super.initState();
    appRouter = AppRouter();
    notificationRepository = NotificationRepository(appRouter: appRouter);
    initializeIsolatePort();
    initializeFirebaseMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }

  Future<void> initializeFirebaseMessaging() async {
    await notificationRepository.initializeFirebaseMessaging();
  }

  void initializeIsolatePort() {
    receivePort = ReceivePort(notificationPortName);
    receivePort.listen((message) {
      log('receivePort: $message');
      if (message != null) {
        appRouter.push(const CallRoute());
      }
    });
    log('registering port with name: $notificationPortName');
    IsolateNameServer.registerPortWithName(
      receivePort.sendPort,
      notificationPortName,
    );
  }
}
