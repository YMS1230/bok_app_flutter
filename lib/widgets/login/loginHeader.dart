import 'package:bok_app_flutter/common/screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: Screen.screenWidth,
      height: Screen.screenHeight,
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: 0, top: Screen.statusBarHeight + 16),
              child: Image.asset(
                "images/login/icon_login_small.png",
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: EdgeInsets.only(
                left: 6, top: Screen.statusBarHeight + 20),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Image.asset(
                  "images/login/icon_login_close.png",
                  width: 26,
                  height: 26,
                )),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: SizedBox(
                  width: 187,
                  height: 232,
                  child: Image.asset(
                    "images/login/icon_login_big.png",
                    width: 348,
                    height: 344,
                    fit: BoxFit.fill,
                  ))),
          Positioned(
              right: 27,
              height: 40,
              top: Screen.statusBarHeight + 25,
              child: TextButton(onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Email',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),)
          ),
          Positioned(
              left: 28,
              top: Screen.statusBarHeight + 188,
              child: const Text(
                'Meet in BikBok',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w500),
              )),
        ]
    ));
  }
}
