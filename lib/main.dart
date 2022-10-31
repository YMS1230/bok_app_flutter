import 'package:bok_app_flutter/routers/login.dart';
import 'package:bok_app_flutter/routers/rootPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,//这里替换你选择的颜色
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      routes: {
        "LoginRouter": (content) => const LoginRouter() // 跳转第 2 个页面的路由
      },
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: const RootPage(),
    );
  }
}
