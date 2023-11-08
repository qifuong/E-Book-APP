import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Search"),
      ),
      body: WebView(
        initialUrl: 'https://www.google.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
