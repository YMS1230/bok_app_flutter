import 'package:flutter/material.dart';
import '/../common/jh_common/widgets/jh_text_list.dart';
import '/project/routes/jh_nav_utils.dart';

class HttpDemoListPage extends StatelessWidget {
  final List titleData = [
    'dio使用',
    '分页加载数据',
  ];
  final List routeData = ['HttpTest1Page', 'HttpPageTestPage'];

  @override
  Widget build(BuildContext context) {
    return JhTextList(
      title: 'HttpDemoList',
      dataArr: titleData,
      callBack: (index, str) {
        JhNavUtils.pushNamed(context, routeData[index]);
      },
    );
  }
}
