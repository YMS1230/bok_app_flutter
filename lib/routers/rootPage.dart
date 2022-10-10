import 'package:bok_app_flutter/routers/camera.dart';
import 'package:bok_app_flutter/routers/home.dart';
import 'package:bok_app_flutter/routers/message.dart';
import 'package:bok_app_flutter/routers/mine.dart';
import 'package:bok_app_flutter/routers/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'dart:io';
import '../common/customFloatingButton.dart';
import '../common/screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
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
    // 初始化Toast
    ToastContext().init(context);
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: InkResponse(
          highlightColor: Colors.transparent,
          radius: 0.0,
          child: CupertinoTabBar(
            backgroundColor: Colors.black,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                if (index!=2) {
                  _currentIndex = index;
                } else {
                  Toast.show("加号点击", duration: 2, gravity: Toast.center);
                }
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
            offsetY: Platform.isIOS && Screen.bottomBarHeight > 0 ? 15 : -10,
            offsetX: 0)
    );
  }
}
