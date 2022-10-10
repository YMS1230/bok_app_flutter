import 'package:bok_app_flutter/routers/camera.dart';
import 'package:bok_app_flutter/routers/home.dart';
import 'package:bok_app_flutter/routers/message.dart';
import 'package:bok_app_flutter/routers/mine.dart';
import 'package:bok_app_flutter/routers/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../common/customFloatingButton.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _currentIndex = 0;
  final List _children = [
    const HomeRouter(),
    const MessageRouter(),
    const CameraRouter(),
    const MineRouter(),
    const WalletRouter()
  ];
  late final void Function() onTabTapped;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    // 屏幕宽(注意是dp, 转换px 需要 screenWidth * pixelRatio)
    double screenWidth = mq.size.width;
    // 屏幕高(注意是dp)
    double screenHeight = mq.size.height;
    // 顶部状态栏, 随着刘海屏会增高
    double statusBarHeight = mq.padding.top;
    // 底部功能栏, 类似于iPhone XR 底部安全区域
    double bottomBarHeight = mq.padding.bottom;

    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: InkResponse(
          highlightColor: Colors.transparent,
          radius: 0.0,
          child: CupertinoTabBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: "Wallet", icon: Icon(Icons.wallet)),
              BottomNavigationBarItem(
                  label: "Camera", icon: Icon(Icons.camera)),
              BottomNavigationBarItem(
                  label: "Message", icon: Icon(Icons.message)),
              BottomNavigationBarItem(label: "Mine", icon: Icon(Icons.people)),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingButtonCustomLocation(
            FloatingActionButtonLocation.centerDocked,
            offsetY: Platform.isIOS && bottomBarHeight > 0 ? 15 : -10,
            offsetX: 0));
  }
}
