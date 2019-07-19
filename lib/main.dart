import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_wechat/home.dart';
import 'package:flutter_wechat/loading.dart';
import 'package:flutter_wechat/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '模仿微信',
      // 自定义主题
      theme: mDefaultTheme,
      /// 添加路由
      routes: <String, WidgetBuilder>{
        // WebView插件
        "home": (BuildContext context) => new HomePage(),
        "/friends": (_) => new WebviewScaffold(
          url: "https://flutter.io/",
          appBar: new AppBar(
            title: new Text("Flutter官网"),
          ),
          withZoom: true,
          withLocalStorage: true,
        ),
        "search": (BuildContext context) => new SearchPage(),
      },
      home: new LoadingPage(),
    );
  }
}

/// 自定义主题
final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.cyan[800],
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.cyan[800],
);
