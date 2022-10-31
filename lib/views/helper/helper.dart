import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void CommonBasicDialog(context, bodyText) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(bodyText),
            ],
          ),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text("확인"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

void OpenEmail(context) async {
  String email = Uri.encodeComponent("present1306@naver.com");
  Uri mail = Uri.parse("mailto:$email");
  // Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  if (!await launchUrl(mail)) {
    String message = "메일 앱을 열 수 없습니다";
    CommonBasicDialog(context, message);
  }
}
