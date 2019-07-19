import 'package:flutter/material.dart';
import 'package:flutter_wechat/chat/chat_item.dart';
import 'package:flutter_wechat/chat/message_data.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: messageData.length,
        itemBuilder: (context,index){
          return new ChatItem(message: messageData[index],);
        },
      ),
    );
  }
}