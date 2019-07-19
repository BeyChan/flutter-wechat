import 'package:flutter/material.dart';
import 'package:flutter_wechat/contacts/contact_vo.dart';

class ContactList extends StatefulWidget {
  ///列表项数据
  final List<ContactVO> items;

  /// 列表头构造器
  final IndexedWidgetBuilder headerBuilder;

  /// 列表项构造器
  final IndexedWidgetBuilder itemBuilder;

  /// 字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  const ContactList(
      {Key key,
      this.items,
      this.headerBuilder,
      this.itemBuilder,
      this.sectionBuilder})
      : super(key: key);

  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  /// 列表滚动控制器
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  /// 判断并显示头部视图或空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  /// 根据定位判断是否显示好友列表头
  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }
    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              /// 滚动控制器
              controller: _scrollController,
              /// list里面的内容不足一屏时,list可以滚动
              physics:  const AlwaysScrollableScrollPhysics(),
              /// 列表长度
              itemCount: widget.items.length,
              /// 列表构造器
              itemBuilder: (context,index){
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      /// 显示列表头
                      _isShowHeaderView(index),
                      /// 用Offstage组件控制是否显示英文字母
                      Offstage(
                        offstage: _shouldShowHeader(index),
                        child: widget.sectionBuilder(context,index),
                      ),
                      /// 显示列表项
                      Column(
                        children: <Widget>[
                          widget.itemBuilder(context,index),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
