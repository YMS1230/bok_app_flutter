///  wx_info_set_page.dart
///
///  Created by iotjin on 2020/09/02.
///  description: 资料设置

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jhtoast/jhtoast.dart';
import '/../common/jh_common/jh_form/jh_set_cell.dart';
import '/project/configs/project_config.dart';
import '/project/model/contacts_model.dart';

class WxInfoSetPage extends StatefulWidget {
  final ContactsModel? _passValue;

  WxInfoSetPage(this._passValue);

  @override
  _WxInfoSetPageState createState() => _WxInfoSetPageState();
}

class _WxInfoSetPageState extends State<WxInfoSetPage> {
  bool _switchSelected = false;
  bool _switchSelected2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _switchSelected = widget._passValue!.isStar!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('资料设置', bgColor: Colors.transparent),
      body: _body(context),
    );
  }

  Widget _body(context) {
    double _cellH = wxCellH;
    double _rowSpace = wxRowSpace;

    return ListView(
      children: <Widget>[
        JhSetCell(
          cellHeight: _cellH,
          title: '备注和标签',
          text: widget._passValue!.label!,
          clickCallBack: () => _clickCell(context, '备注和标签'),
        ),
        JhSetCell(
          cellHeight: _cellH,
          title: '朋友权限',
          hiddenLine: true,
          clickCallBack: () => _clickCell(context, '朋友权限'),
        ),
        SizedBox(height: _rowSpace),
        JhSetCell(
          cellHeight: _cellH,
          titleWidth: 150,
          title: widget._passValue!.sex == '0' ? '把他推荐给朋友' : '把她推荐给朋友',
          hiddenLine: true,
          clickCallBack: () => _clickCell(context, widget._passValue!.sex == '0' ? '把他推荐给朋友' : '把她推荐给朋友'),
        ),
        SizedBox(height: _rowSpace),
        JhSetCell(
          cellHeight: _cellH,
          title: '设为星标朋友',
          hiddenLine: true,
          hiddenArrow: true,
          rightWidget: CupertinoSwitch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          clickCallBack: () => _clickCell(context, '设为星标朋友'),
        ),
        SizedBox(height: _rowSpace),
        JhSetCell(
          cellHeight: _cellH,
          title: '加入黑名单',
          hiddenArrow: true,
          rightWidget: CupertinoSwitch(
            value: _switchSelected2,
            onChanged: (value) {
              setState(() {
                _switchSelected2 = value;
              });
            },
          ),
          clickCallBack: () => _clickCell(context, '加入黑名单'),
        ),
        JhSetCell(
          cellHeight: _cellH,
          title: '投诉',
          hiddenLine: true,
          clickCallBack: () => _clickCell(context, '投诉'),
        ),
        SizedBox(height: _rowSpace),
        InkWell(
          onTap: () => _clickCell(context, '删除'),
          child: Container(
              height: _cellH,
              color: KColors.dynamicColor(context, KColors.kCellBgColor, KColors.kCellBgDarkColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('删除', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red))
                ],
              )),
        )
      ],
    );
  }

  void _clickCell(context, title) {
    JhToast.showText(context, msg: '点击 $title');
  }
}
