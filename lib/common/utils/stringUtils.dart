
extension StringExtension on String? {
  /// String 空安全处理
  String get jhNullSafe => this ?? '';
}

extension NumExtension on num? {
  /// num类型转String类型整数
  String get jhToIntStr => (this ?? 0).toInt().toString();
}

class JhStringUtils {
  /// num类型转String类型整数
  static String toIntStr(num? value) {
    return (value ?? 0).toInt().toString();
  }
}