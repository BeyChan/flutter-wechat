import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    
    super.initState();
    //  在加载页面停留3秒
    new Future.delayed(Duration(seconds:3),(){
      print("FLutter即时通讯App界面实现...");
      Navigator.of(context).pushReplacementNamed("home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/loading.jpeg",fit: BoxFit.cover,),
        ],
      ),
    );
  }
}