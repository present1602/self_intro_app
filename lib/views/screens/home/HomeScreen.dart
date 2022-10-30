import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void openSelfIntroWeb(int i) async {
  const url0 = "http://cypf202110.s3-website.ap-northeast-2.amazonaws.com/";
  const url1 =
      "https://www.notion.so/Kim-Chiyeon-fa8a17b370754304a57563e6e1a8d1ed";
  if (i == 0) {
    if (await canLaunchUrl(Uri.parse(url0))) {
      await launchUrl(Uri.parse(url0));
    } else {
      throw 'Could not launch $url0';
    }
  } else {
    if (await canLaunchUrl(Uri.parse(url1))) {
      await launchUrl(Uri.parse(url1));
    } else {
      throw 'Could not launch $url1';
    }
  }
}

// _launchURLBrowser() async {
//   const url = 'https://flutterdevs.com/';
// if (await canLaunch(url)) {
//   await launch(url);
// } else {
//   throw 'Could not launch $url';
// }

class _HomeScreenState extends State<HomeScreen> {
  void showModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                content: Container(
              width: 300,
              height: 100,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (c, i) {
                    return GestureDetector(
                        onTap: () {
                          openSelfIntroWeb(i);
                        },
                        child: Text(i == 0 ? "이력서" : "노션"));
                  }),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.asset(
        'assets/images/app_title.png',
        height: 50,
      ),
      Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  showModal(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: <Widget>[
                    Text("이력서"),
                    Icon(Icons.arrow_drop_down)
                  ]),
                )),
            Expanded(
              child: Container(),
            ),
            // Flexible(
            //   fit: FlexFit.tight,
            //   child: Container(),
            // ),
            Icon(Icons.alarm)
          ],
        ),
      )
    ]);
  }
}
