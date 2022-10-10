import 'package:bok_app_flutter/routers/rootPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const RootPage(),
    );
  }
}
