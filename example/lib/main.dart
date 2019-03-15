import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter_microduino_html/flutter_microduino_html.dart';

String selectedUrl = 'https://flutter.io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) {
          return WebviewScaffold(
            url: Platform.isIOS
                ? 'Frameworks/App.framework/flutter_assets/assets/'
                : "file:///android_asset/flutter_assets/assets/index.html",
            appBar: AppBar(
              title: const Text('Widget WebView'),
            ),
            withZoom: true,
            withLocalStorage: true,
            withJavascript:true,
            hidden: true,
            withLocalUrl: true,
            initialChild: Container(
              color: Colors.redAccent,
              child: const Center(
                child: Text('Waiting.....'),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () async {
                      String a = await flutterWebViewPlugin.registerHandler('submitFromWeb');
                      print('a====>$a}');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      flutterWebViewPlugin.goForward();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.autorenew),
                    onPressed: () {
                      flutterWebViewPlugin.evalJavascript('a', '123');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      },
    );
  }
}
