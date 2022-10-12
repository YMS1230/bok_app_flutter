///  wx_subscription_number_list_page.dart
///
///  Created by iotjin on 2020/09/03.
///  description:

import 'package:flutter/material.dart';
import 'package:jhtoast/jhtoast.dart';
import '/../common/jh_common/jh_form/jh_searchbar.dart';
import '/project/configs/project_config.dart';

var _dataArr;

List _getData() {
  _dataArr = [];
  for (int i = 0; i < 50; i++) {
    var map = new Map();
    map['title'] = 'title$i';
    map['subtitle'] = '这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容';
    map['img'] = 'assets/images/ic_demo1.png';
    map['time'] = '17:30';
    _dataArr.add(map);
  }
  return _dataArr;
}

class WxSubscriptionNumberListPage extends StatelessWidget {
  WxSubscriptionNumberListPage({Key? key}) : super(key: key) {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('订阅号', rightImgPath: 'assets/images/ic_more_black.png', bgColor: Colors.transparent,
          rightItemCallBack: () {
        _clickCell(context, '更多');
      }),
      body: _body(context, _dataArr),
      backgroundColor: KColors.dynamicColor(context, KColors.wxBgColor, KColors.kBgDarkColor),
    );
  }

  // body
  Widget _body(context, dataArr) {
    Widget _searchBar = JhSearchBar(
      hintText: '微信号/手机号',
      bgColor: KColors.dynamicColor(context, KColors.wxBgColor, KColors.kNavBgDarkColor),
    );

    return ListView.separated(
        // 列表项构造器
        itemCount: dataArr.length + 1,
        // 分割器构造器
        separatorBuilder: (context, index) {
          return Divider(
            height: .5,
            indent: 70,
            endIndent: 0,
            color: KColors.dynamicColor(context, KColors.kLineColor, KColors.kLineDarkColor),
          );
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return _searchBar;
          }
          return _cell(context, dataArr[index]);
        });
  }

  // cell
  Widget _cell(context, item) {
    return InkWell(
        onTap: () => _clickCell(context, item['title']),
        child: Container(
            color: KColors.dynamicColor(context, KColors.kCellBgColor, KColors.kCellBgDarkColor),
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      item['img'],
                      width: 60,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
//                Container(color: KColors.kLineColor, height: 0.8),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Expanded(flex: 70, child: Text(item['title'], style: TextStyle(fontSize: 18))),
                        Expanded(
                            flex: 30,
                            child: Text(
                              item['time'],
                              style: TextStyle(fontSize: 13, color: Colors.grey),
                              textAlign: TextAlign.right,
                            )),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(item['subtitle'],
                          style: TextStyle(fontSize: 15, color: Colors.grey), overflow: TextOverflow.ellipsis),
                    )
                  ],
                )),
              ],
            )));
  }

  // 点击cell
  _clickCell(context, text) {
    JhToast.showText(context, msg: '点击 $text');
  }

// // 点击侧滑按钮
// void _showSnackBar(context, text) {
//   print(text);
//   JhToast.showText(context, msg: text);
// }
}
