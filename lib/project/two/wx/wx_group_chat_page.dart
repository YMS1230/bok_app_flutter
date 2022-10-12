///  wx_group_chat_page.dart
///
///  Created by iotjin on 2020/09/08.
///  description: 群聊

import 'package:flutter/material.dart';
import 'package:jhtoast/jhtoast.dart';
import '/../common/jh_common/jh_form/jh_searchbar.dart';
import '/../common/jh_common/jh_form/jh_set_cell.dart';
import '/project/configs/project_config.dart';

List _dataArr = [
  {
    'title': '群聊一',
    'subtitle': '群聊一',
    'img': 'assets/images/picture/touxiang_1.jpeg',
  },
  {
    'title': '群聊2',
    'subtitle': 'hello',
    'img': 'assets/images/picture/touxiang_2.jpeg',
  },
  {
    'title': '群聊3',
    'subtitle': '[图片]',
    'img': 'assets/images/picture/touxiang_3.jpeg',
  },
  {
    'title': '群聊4',
    'subtitle': '[动画表情]',
    'img': 'assets/images/picture/touxiang_4.jpeg',
  },
  {
    'title': '群聊666',
    'subtitle': '',
    'img': 'assets/images/picture/touxiang_5.jpeg',
  },
  {
    'title': 'HHHHHH',
    'subtitle': 'hi',
    'img': 'assets/images/picture/touxiang_6.jpg',
  },
];

class WxGroupChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('群聊', bgColor: Colors.transparent),
      body: _body(context),
      backgroundColor: KColors.dynamicColor(context, KColors.wxBgColor, KColors.kBgDarkColor),
    );
  }

  Widget _body(context) {
    Widget _searchBar = JhSearchBar(
      hintText: '搜索',
      bgColor: KColors.dynamicColor(context, KColors.wxBgColor, KColors.kNavBgDarkColor),
    );

    List<Widget> _topWidgetList = _dataArr.map((item2) => _cell(context, item2)).toList();

    _topWidgetList.insert(0, _searchBar);

    return ListView(
      children: _topWidgetList,
    );
  }

  // cell
  Widget _cell(context, itemData) {
    double _cellH = 55.0;
    double _leftSpace = 65.0;
    double _imgWH = 40;

    return JhSetCell(
      leftImgWH: _imgWH,
      cellHeight: _cellH,
      lineLeftEdge: _leftSpace,
      title: itemData['title'],
      hiddenArrow: true,
      leftWidget: Container(
        height: _imgWH,
        width: _imgWH,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              itemData['img'],
            ),
          ),
        ),
      ),
      clickCallBack: () => _clickCell(context, itemData['title']),
    );
  }

  // 点击cell
  _clickCell(context, text) {
    JhToast.showText(context, msg: '点击 $text');
  }
}
