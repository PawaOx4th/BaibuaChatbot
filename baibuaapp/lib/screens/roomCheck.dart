import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RoomCheck extends StatefulWidget {
  RoomCheck({Key key}) : super(key: key);

  @override
  _RoomCheckState createState() => _RoomCheckState();
}

class _RoomCheckState extends State<RoomCheck> {
  String urlWeb =
      "https://oreg3.rmutt.ac.th/registrar/room_timeall.asp?f_cmd=1&campusid=1&campusname=%C1%CB%D2%C7%D4%B7%C2%D2%C5%D1%C2%E0%B7%A4%E2%B9%E2%C5%C2%D5%C3%D2%AA%C1%A7%A4%C5%B8%D1%AD%BA%D8%C3%D5&bc=%C3%BB13%AA%D1%E9%B9&bn=%CD%D2%A4%D2%C3%E0%C3%D5%C2%B9%C3%C7%C1%E1%C5%D0%BB%AF%D4%BA%D1%B5%D4%A1%D2%C3+%28%B5%D6%A1%CA%D5%E0%A2%D5%C2%C7+13+%AA%D1%E9%B9%29&roomid=&acadyear=2562&firstday=2/3/2563&weekd=2&semester=2";

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
