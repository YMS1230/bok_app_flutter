import 'package:flutter/cupertino.dart';

import '../../main.dart';

class ScreenUtils {
  static MediaQueryData mq =
      MediaQuery.of(navigatorKey.currentState!.overlay!.context);
  // 屏幕宽(注意是dp, 转换px 需要 screenWidth * pixelRatio)
  static double screenWidth = mq.size.width;
  // 屏幕高(注意是dp)
  static double screenHeight = mq.size.height;
  // 顶部状态栏, 随着刘海屏会增高
  static double statusBarHeight = mq.padding.top;
  // 底部功能栏, 类似于iPhone XR 底部安全区域
  static double bottomBarHeight = mq.padding.bottom;
}
