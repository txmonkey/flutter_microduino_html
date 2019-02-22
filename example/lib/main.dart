import 'dart:async';
import 'package:flutter/material.dart';
import 'package:microduino_webview/microduino_webview.dart';
import 'package:microduino_webview/chrome_safari_example.screen.dart';
import 'package:microduino_webview/inline_example.screen.dart';
import 'package:microduino_webview/webview_example.screen.dart';

Future main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              WebviewExampleScreen(),
              ChromeSafariExampleScreen(),
              InlineExampleScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Webview"),
                Tab(text: "Chrome/Safari"),
                Tab(
                  text: "Inline",
                ),
              ],
            ),
          ))),
    );
  }
}
