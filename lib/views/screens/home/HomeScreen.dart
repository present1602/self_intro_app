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
      ),
      Container(
        width: double.infinity,
        height: 250,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              "저를 소개합니다. :)",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text("육아크루의 개발팀! 나를 발견하다니 행운이다"),
            // Image.asset(
            //   'assets/images/prof.png',
            //   height: 100,
            // ),
            SizedBox(
              height: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: const Image(
                image: AssetImage('assets/images/prof.png'),
                height: 60,
              ),
            ),
            Text(
              "이름",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(text: '86년생'),
                  WidgetSpan(child: Icon(Icons.radio_button_off)),
                  TextSpan(text: '플러터 개발자'),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  child: Text("소개글 읽기"),
                ))
          ],
        ),
      ),
    ]);
  }
}
