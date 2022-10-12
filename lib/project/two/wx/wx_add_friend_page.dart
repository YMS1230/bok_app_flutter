///  wx_add_friend_page.dart
///
///  Created by iotjin on 2020/09/01.
///  description: 添加朋友

import 'package:flutter/material.dart';
import 'package:jhtoast/jhtoast.dart';
import '/../common/jh_common/jh_form/jh_searchbar.dart';
import '/project/configs/project_config.dart';

List _dataArr = [
  {
    'title': '雷达加朋友',
    'subtitle': '添加身边的朋友',
    'img': 'assets/wechat/contacts/add/add_friend_icon_reda_36x36_@3x.png',
  },
  {
    'title': '面对面建群',
    'subtitle': '与身边的朋友进入同一个群聊',
    'img': 'assets/wechat/contacts/add/add_friend_icon_addgroup_36x36_@3x.png',
  },
  {
    'title': '扫一扫',
    'subtitle': '扫描二维码名片',
    'img': 'assets/wechat/contacts/add/add_friend_icon_scanqr_36x36_@3x.png',
  },
  {
    'title': '手机联系人',
    'subtitle': '添加手机通讯录中的朋友',
    'img': 'assets/wechat/contacts/add/add_friend_icon_contacts_36x36_@3x.png',
  },
  {
    'title': '公众号',
    'subtitle': '获取更多资讯和服务',
    'img': 'assets/wechat/contacts/add/add_friend_icon_offical_36x36_@3x.png',
  },
  {
    'title': '企业微信联系人',
    'subtitle': '通过手机号搜索企业微信用户',
    'img': 'assets/wechat/contacts/add/add_friend_icon_search_wework_40x40_@2x.png',
  },
];

class WxAddFriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('添加朋友', bgColor: Colors.transparent),
      body: _body(context),
      backgroundColor: KColors.dynamicColor(context, KColors.wxBgColor, KColors.kBgDarkColor),
    );
  }

  Widget _body(context) {
    Widget _searchBar = JhSearchBar(
      hintText: '微信号/手机号',
      bgColor: KColors.dynamicColor(context, KColors.wxBgColor, KColors.kNavBgDarkColor),
    );

    Widget _myCode = Container(
        height: 60,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('我的微信号：abc'),
              SizedBox(width: 10),
              Image.asset('assets/wechat/contacts/add/add_friend_myQR_20x20_@2x.png', width: 20)
            ]));

    List<Widget> _topWidgetList = _dataArr.map((item2) => _cell(context, item2)).toList();

    _topWidgetList.insert(0, _myCode);
    _topWidgetList.insert(0, _searchBar);

    return ListView(
      children: _topWidgetList,
    );
  }

  // cell
  Widget _cell(context, item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            color: KColors.dynamicColor(context, KColors.kCellBgColor, KColors.kCellBgDarkColor),
            child: ListTile(
                onTap: () => _clickCell(context, item['title']),
                leading: Container(
                    child: CircleAvatar(
                        backgroundImage: AssetImage(
                  item['img'],
                ))),
                title: Text(
                  item['title'],
                  style: TextStyle(color: KColors.wxTextBlueColor),
                ),
                subtitle: Text(
                  item['subtitle'],
                ),
                trailing: Icon(Icons.arrow_forward_ios))),
        SizedBox(
          width: 70,
          height: 1,
          child: Container(
            color: KColors.dynamicColor(context, KColors.kLineColor, KColors.kLineDarkColor),
          ),
        )
      ],
    );
  }

  // 点击cell
  _clickCell(context, text) {
    JhToast.showText(context, msg: '点击 $text');
  }
}
