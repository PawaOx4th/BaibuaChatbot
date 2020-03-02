import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ClassSchedule extends StatefulWidget {
  ClassSchedule({Key key}) : super(key: key);

  @override
  _ClassScheduleState createState() => _ClassScheduleState();
}

class _ClassScheduleState extends State<ClassSchedule> {
  String urlWeb =
      "https://oreg3.rmutt.ac.th/registrar/learn_time.asp?avs658856813=3";

  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: urlWeb,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController web) {
            _completer.complete(web);
          },
        ),
      ),
    );
  }
}
