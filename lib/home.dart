import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/chat/chat_page.dart';
import 'package:flutter_wechat/contacts/contact_page.dart';
import 'package:flutter_wechat/personal/personal_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 当前选择索引
  var _currentIndex = 0;

  /// 聊天页面
  ChatPage chat;

  /// 好友页面
  ContactPage contacts;

  /// 我的页面
  PersonalPage me;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("我的微信"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              /// 跳转到搜索页面
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                showMenu(
                  context: context,
                  /// 弹窗位置
                  position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                  items: <PopupMenuEntry>[
                    _popupMenuItem('发起会话',
                        imagePath: 'images/icon_menu_group.png'),
                    _popupMenuItem('添加好友',
                        imagePath: 'images/icon_menu_addfriend.png'),
                    _popupMenuItem('联系客服', icon: Icons.person),
                  ],
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      /// 底部导航栏
      bottomNavigationBar: new BottomNavigationBar(
        /// 通过fixedColor设置选中item的颜色
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        /// 底部导航栏按钮项
        items: [
          ///导航按钮项传入文本及图标
          new BottomNavigationBarItem(
              title: new Text(
                '聊天',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Colors.cyan[800]
                        : Color(0xff999999)),
              ),
              ///判断当前索引作图片切换显示
              icon: _currentIndex == 0
                  ? Image.asset(
                      'images/message_pressed.png',
                      width: 32.0,
                      height: 28.0,
                      color: Colors.cyan[800],
                    )
                  : Image.asset(
                      'images/message_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          new BottomNavigationBarItem(
              title: new Text(
                '好友',
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Colors.cyan[800]
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset(
                      'images/contact_list_pressed.png',
                      width: 32.0,
                      height: 28.0,
                      color: Colors.cyan[800],
                    )
                  : Image.asset(
                      'images/contact_list_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          new BottomNavigationBarItem(
              title: new Text(
                '我的',
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Colors.cyan[800]
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset(
                      'images/profile_pressed.png',
                      width: 32.0,
                      height: 28.0,
                      color: Colors.cyan[800],
                    )
                  : Image.asset(
                      'images/profile_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
        ],
      ),
      body: currentPage(),
    );
  }
  
  currentPage() {
    switch(_currentIndex) {
      case 0:
        if (chat == null) {
          chat = new ChatPage();
        }
        return chat;
      case 1:
        if (contacts == null) {
          contacts = new ContactPage();
        }
        return contacts;
      case 2:
        if (me == null) {
          me = new PersonalPage();
        }
        return me;
    }
  }

  /// 渲染某个菜单项,传入菜单标题,图片路径或图表
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          /// 判断使用图片路径还是图标
          imagePath != null
              ? Image.asset(
                  imagePath,
                  width: 32.0,
                  height: 32.0,
                )
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(icon, color: Colors.white),
                ),
          /// 显示菜单文本内容                
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style:TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  
}
