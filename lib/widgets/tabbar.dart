import 'package:bok_app_flutter/routers/camera.dart';
import 'package:bok_app_flutter/routers/home.dart';
import 'package:bok_app_flutter/routers/message.dart';
import 'package:bok_app_flutter/routers/mine.dart';
import 'package:bok_app_flutter/routers/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Wallet", icon: Icon(Icons.wallet)),
          BottomNavigationBarItem(label: "Camera", icon: Icon(Icons.camera)),
          BottomNavigationBarItem(label: "Message", icon: Icon(Icons.message)),
          BottomNavigationBarItem(label: "Mine", icon: Icon(Icons.people)),

        ],
      ),
    );
  }
}
