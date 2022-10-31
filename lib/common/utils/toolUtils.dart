import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class JhCommonUtils {
  /// 获取随机数
  static double getRandom(int min, int max) {
    if (max > min) {
      return min + Random.secure().nextInt(max - min) + 0.0;
    } else {
      return max + Random.secure().nextInt(min - max) + 0.0;
    }
  }

  /// 打开链接
  static Future<void> launchWebURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // 打开链接失败
    }
  }

  /// 调起拨号页
  static Future<void> launchTelURL(String phone) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // 拨号失败
    }
  }

  /// 跳转AppStore
  static Future<void> jumpAppStore({String? url}) async {
    // 这是微信的地址，到时候换成自己的应用的地址
    final pushUrl = url ?? 'itms-apps://itunes.apple.com/cn/app/id414478124?mt=8';
    final Uri uri = Uri.parse(pushUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // 跳转失败
    }
  }
}
