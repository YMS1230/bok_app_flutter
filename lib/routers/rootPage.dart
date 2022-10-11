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
import 'package:bok_app_flutter/common/customBottomNavigationBarItem.dart'
    as MyBarItem;

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  final List _children = [
    const HomeRouter(),
    const WalletRouter(),
    const CameraRouter(),
    const MessageRouter(),
    const MineRouter()
  ];
  late final void Function() onTabTapped;

  final itemNames = [
    _Item('首页', 'images/tab/home_n.png', 'images/tab/home_h.png'),
    _Item('成长墙', 'images/tab/wallet_n.png', 'images/tab/wallet_h.png'),
    _Item('', 'images/tab/plus.png', 'images/tab/plus.png'),
    _Item('已购', 'images/tab/message_n.png', 'images/tab/message_h.png'),
    _Item('我的', 'images/tab/mine_n.png', 'images/tab/mine_h.png')
  ];

  late List<MyBarItem.BottomNavigationBarItem> itemList;


  @override
  Widget build(BuildContext context) {
    // 初始化Toast
    ToastContext().init(context);
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: InkResponse(
        highlightColor: Colors.red,
        radius: 0.0,
        child: CupertinoTabBar(
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              if (index != 2) {
                _currentIndex = index;
              } else {
                Toast.show("加号点击", duration: 2, gravity: Toast.center);
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Image.asset("images/tab/home_n.png",
                    width: 25, height: 25, fit: BoxFit.cover),
                activeIcon: Image.asset("images/tab/home_h.png",
                    width: 25, height: 25, fit: BoxFit.cover)),
            BottomNavigationBarItem(
                label: "Wallet",
                icon: Image.asset("images/tab/wallet_n.png",
                    width: 25, height: 25, fit: BoxFit.cover),
                activeIcon: Image.asset("images/tab/wallet_h.png",
                    width: 25, height: 25, fit: BoxFit.cover)),
            BottomNavigationBarItem(
                label: "",
                icon:
                    Image.asset("images/tab/plus.png", width: 0, height: 0)),
            BottomNavigationBarItem(
                label: "Message",
                icon: Image.asset("images/tab/message_n.png",
                    width: 25, height: 25, fit: BoxFit.cover),
                activeIcon: Image.asset("images/tab/message_h.png",
                    width: 25, height: 25, fit: BoxFit.cover)),
            BottomNavigationBarItem(
              label: "Mine",
              icon: Image.asset("images/tab/mine_n.png",
                  width: 25, height: 25, fit: BoxFit.cover),
              activeIcon: Image.asset("images/tab/mine_h.png",
                  width: 25, height: 25, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Image.asset("images/tab/plus.png",
              width: 40, height: 40, fit: BoxFit.cover),
          onPressed: () {},
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonLocation: FloatingButtonCustomLocation(
          FloatingActionButtonLocation.centerDocked,
          offsetY: Platform.isIOS && Screen.bottomBarHeight > 0 ? 25 : -10,
          offsetX: 0),
      floatingActionButtonAnimator: NoScalingAnimation(),
    );
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}
