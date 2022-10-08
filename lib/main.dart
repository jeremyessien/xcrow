import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xcrow/views/screens/splash_screen.dart';

import 'main_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), //
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      onGenerateTitle: (context) {
        return 'Xcrow';
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      // home: const HomeScreen(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SellersScreen.routeName:
                return const SellersScreen();
              case TransactionsInfoScreen.routeName:
                return const TransactionsInfoScreen();
              case ChatScreen.routeName:
                return const ChatScreen();
              case ConfirmationScreen.routeName:
                return const ConfirmationScreen();
              case ReviewScreens.routeName:
                return const ReviewScreens();
              default:
                return const HomeScreen();
            }
          },
        );
      },
    );
  }
}
