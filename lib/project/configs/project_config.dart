///  project_config.dart
///
///  Created by iotjin on 2020/05/07.
///  description:  项目的一些全局配置项，数据持久化使用的key

export 'colors.dart';
export 'dimens.dart';
export 'gaps.dart';
export 'strings.dart';
export 'styles.dart';

import 'package:bok_app_flutter/common/http/apis.dart';
import 'package:bok_app_flutter/common/http/http_utils.dart';
import 'package:bok_app_flutter/common/jh_common/utils/jh_screen_utils.dart';

export '/project/routes/jh_nav_utils.dart';
export '/base_appbar.dart';

double wxCellH = 55.0;
double wxRowSpace = 6.0;

/// ******************************* 数据存储 相关 ********************************

// 保存本地的用户model
const kUserDefault_UserInfo = 'UserInfo';
// 上次版本号
const kUserDefault_LastVersion = 'kUserDefault_LastVersion';
