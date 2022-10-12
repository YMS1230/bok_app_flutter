import 'package:flutter/material.dart';
import '/../common/jh_common/widgets/jh_text_list.dart';
import '/project/routes/jh_nav_utils.dart';

class DemoListPage extends StatelessWidget {
  final List titleData = [
    'UI',
    '基类',
    'ListView',
    'GridView',
    'Chart',
    '网络请求',
    'base64、AES、MD5和本地加密存储',
    '底部、中间、toast、自定义弹框',
    'JhForm表单',
    'Form',
    'JhTopTabBar',
    '跳转传值和回传',
    '图片选择',
    '搜索框',
    '小红点',
    '轮播',
    '二维码',
    'Animation',
    '列表侧滑',
    '城市选择列表',
    '拖拽排序',
    '设备信息'
  ];
  final List routeData = [
    'UIDemoListPage',
    'BaseDemoListPage',
    'ListViewDemoListPage',
    'GridViewDemoListPage',
    'ChartDemoListPage',
    'HttpDemoListPage',
    'AESTestPage',
    'AlertDemoListPage',
    'FormDemoListPage',
    'FormTest',
    'TopTabBarDemoListPage',
    'PassValuePage',
    'PhotoSelectTest',
    'SearchDemoListPage',
    'RedDotPage',
    'SwiperDemoListPage',
    'QRCodeTest',
    'AnimationDemoListPage',
    'SideslipTestPage',
    'CitySelectListPage',
    'DragSortDemoListPage',
    'DeviceInfoTest',
  ];

  @override
  Widget build(BuildContext context) {
    return JhTextList(
      title: 'DemoList',
      dataArr: titleData,
      callBack: (index, str) {
//          print(index);
        print(str);
//          print(routeData[index]);
        JhNavUtils.pushNamed(context, routeData[index]);
      },
    );
  }
}
