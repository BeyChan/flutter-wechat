import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/chat/message_data.dart';
import 'package:flutter_wechat/common/touch_callback.dart';

/// 聊天页面
class ChatItem extends StatelessWidget {
  final MessageData message;

  const ChatItem({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 最外层容器
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        /// 仅加一个底部边 这样整个列表的每项信息下面都会有一条边
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 64.0,
      child: TouchCallBack(
        onPressed: () {},

        /// 整体方向水平布局
        child: Row(
          /// 垂直方向居中显示
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 展示头像

            Container(
                width: 48.0,
                height: 48.0,
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    message.avatar,
                    fit: BoxFit.fill,
                  ),
                )),
            Expanded(
              /// 主标题和子标题采用垂直布局
              child: Column(
                /// 垂直方向居中对齐
                mainAxisAlignment: MainAxisAlignment.center,

                /// 水平方向靠左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.title,
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    message.subTitle,
                    style: TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                    maxLines: 1,
                    //显示不完的文本用省略号来表示
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              /// 时间顶部对齐
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12.0, top: 12.0),
              child: Text(
                /// 格式化时间
                formatDate(message.time, [HH, ':', nn, ':', 'ss']).toString(),
                style: TextStyle(fontSize: 12.0, color: Color(0xFFa9a9a9)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
