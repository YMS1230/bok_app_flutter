import 'package:flutter/material.dart';
import '/../common/jh_common/widgets/jh_text_list.dart';
import '/project/routes/jh_nav_utils.dart';

class ChartDemoListPage extends StatelessWidget {
  final List titleData = [
    'Graphic - 柱状图',
    'Graphic - 折线图',
    'Graphic - 饼图',
    'ECharts1 - 平滑折线图 警戒线',
    'ECharts2 - 多图表',
    'ECharts3 - 多图表 - 动态数据',
    'ECharts4 - 渐变折线图',
    'Chart1',
    'Chart2',
    'MpChartLine1',
    'MpChartBar1',
    'MpChartCombined',
  ];
  final List routeData = [
    'GraphicBarPage',
    'GraphicLinePage',
    'GraphicPiePage',
    'EChartPage1',
    'EChartPage2',
    'EChartPage3',
    'EChartPage4',
    'ChartPage1',
    'ChartPage2',
    'MpChartLinePage1',
    'MpChartBarPage1',
    'MpChartCombinedPage',
  ];

  @override
  Widget build(BuildContext context) {
    return JhTextList(
      title: 'Chart',
      dataArr: titleData,
      callBack: (index, str) {
        print(index);
        JhNavUtils.pushNamed(context, routeData[index]);
      },
    );
  }
}
