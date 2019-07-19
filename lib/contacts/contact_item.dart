import 'package:flutter/material.dart';
import 'package:flutter_wechat/contacts/contact_vo.dart';

class ContactItem extends StatelessWidget {
  ///好友数据VO
  final ContactVO item;

  ///标题名
  final String titleName;

  /// 图标名称
  final String imageName;

  const ContactItem({Key key, this.item, this.titleName, this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //每条列表项底部加一个边框
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///展示头像或图片
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: imageName == null
                ? FadeInImage.assetNetwork(
                  placeholder: "images/icon_groupchat",
                    image: item.avatarUrl != ''
                        ? item.avatarUrl
                        : 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563455772339&di=739fe4bf8359c44e0836b0bbd3a07c1b&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F9662a766b2e14418b22ed6e8185913c3e7562ab455df-j8mU0R_fw658',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    imageName,
                    width: 40.0,
                    height: 40.0,
                  ),
            ),
            

            /// 展示名称或标题
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                titleName == null ? item.name ?? '暂时' : titleName,
                style: TextStyle(fontSize: 18.0, color: Color(0xFF353535)),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
