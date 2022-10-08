import 'package:flutter/material.dart';
import 'package:xcrow/src/views/screens/transaction_info_screen.dart';
import 'package:xcrow/views/screens/chat_screen.dart';
import 'package:xcrow/views/screens/confirmation_screen.dart';
import 'package:xcrow/views/screens/reviews_screen.dart';
import 'package:xcrow/views/screens/services_screen.dart';
import 'main_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
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
