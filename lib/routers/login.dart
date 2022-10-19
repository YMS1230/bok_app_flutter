import 'package:bok_app_flutter/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:bok_app_flutter/common/screen.dart';
import 'package:toast/toast.dart';
import '../widgets/login/InputPasswordTextField.dart';
import '../widgets/login/inputNumberTextField.dart';
import '../widgets/login/loginHeader.dart';

class LoginRouter extends StatefulWidget {
  const LoginRouter({Key? key}) : super(key: key);

  @override
  State<LoginRouter> createState() => _LoginRouterState();
}

class _LoginRouterState extends State<LoginRouter> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Container(
            width: Screen.screenWidth,
            height: Screen.screenHeight,
            decoration: const BoxDecoration(color: KColors.loginBackColor),
            child: Stack(
              children: [
                const LoginHeader(),
                Positioned(
                    left: 28,
                    right: 28,
                    top: Screen.statusBarHeight + 308,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: const InputNumberTextField(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 60),
                          child: const InputPasswordTextField(),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 9, left: 0),
                          child: const Text(
                              "Account will be automatically registered",
                              style: TextStyle(color: Color(0xff4B4B4B))),
                        ),
                        Container(
                            width: Screen.screenWidth - 56,
                            margin: const EdgeInsets.only(top: 45),
                            child: InkWell(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset("images/login/icon_login.png",
                                      fit: BoxFit.fitWidth),
                                  const Text('Log in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18)),
                                ],
                              ),
                              onTap: () {
                                Toast.show("登录", gravity: Toast.center);
                              },
                            )),
                        Container(
                          height: 34,
                          margin: const EdgeInsets.only(top: 0),
                          child: TextButton(
                            onPressed: (){
                              Toast.show("切换账号", gravity: Toast.center);
                            },
                            child: const InkWell(
                              child: Text("Account Login",style: TextStyle(color: Color(0xff7A7A7A),fontSize: 12)),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            )));
  }
}
