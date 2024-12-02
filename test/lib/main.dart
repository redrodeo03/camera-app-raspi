import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pi Camera Stream'),
        ),
        body: const WebView(
          initialUrl: 'http://192.168.120.175:5000',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
