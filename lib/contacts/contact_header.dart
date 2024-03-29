import 'package:flutter/material.dart';
import './contact_item.dart';

class ContactHeader extends StatelessWidget {
  const ContactHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ContactItem(titleName:'新加好友',imageName:'images/icon_addfriend.png'),
          ContactItem(titleName:'公共聊天室',imageName:'images/icon_groupchat.png'),
        ],
      ),
    );
  }
}