import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:selfintro/model/myKeyword.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helper/helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<MyKeyword> keywordCardListData = [
  MyKeyword(keyword: '성실', content: '성실합니다.'),
  MyKeyword(keyword: '책임감', content: '책임감이 강합니다.'),
  MyKeyword(keyword: '성장욕구', content: '성장욕구가 강합니다.'),
];

Future<void> _dialog(BuildContext context, MyKeyword myKeyword) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Text("body ${myKeyword.keyword}"),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30, 70, 30, 30),
                      decoration: BoxDecoration(
                          color: Colors.grey[300], shape: BoxShape.circle),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    // alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(myKeyword.keyword),
                        Divider(),
                        Text(myKeyword.content)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Positioned(
                right: 30,
                top: 30,
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
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

void ContactDialog(context) {
  showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),

          content: SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("이메일 : present1306@naver.com"),
                          SizedBox(height: 15),
                          Text("연락처 : 010-4760-8447"),
                        ],
                      ),
                    )),

                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                color: Colors.grey[100],
                                alignment: Alignment.center,
                                child: Text("닫기")),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              OpenEmail(context);
                            },
                            child: Container(
                                color: Colors.green[300],
                                alignment: Alignment.center,
                                child: Text(
                                  "연락하기",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    ))
                // Text(
                //   "Dialog Content",
                // ),
              ],
            ),
          ),
          // actions: <Widget>[
          //   ElevatedButton(
          //     child: new Text("확인"),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ],
        );
      });
}

// _launchURLBrowser() async {
//   const url = 'https://flutterdevs.com/';
// if (await canLaunch(url)) {
//   await launch(url);
// } else {
//   throw 'Could not launch $url';
// }

void openKeywordDetailPopup(item) {}

class _HomeScreenState extends State<HomeScreen> {
  void showModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            content: Container(
                width: 300,
                height: 100,
                child: ListView(
                  children: ListTile.divideTiles(
                      //          <-- ListTile.divideTiles
                      context: context,
                      tiles: [
                        ListTile(
                          title: GestureDetector(
                              onTap: () {
                                openSelfIntroWeb(0);
                              },
                              child: Text('이력서')),
                        ),
                        ListTile(
                          onTap: () {
                            openSelfIntroWeb(1);
                          },
                          title: Text('노션'),
                        ),
                      ]).toList(),
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/app_title.png',
                height: 50,
              ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
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
                  Container(
                      width: 25,
                      child: Image.asset('assets/images/bell_icon.png'))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.amber,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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

                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "김치연",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(text: '86년생 '),
                        // WidgetSpan(child: Image.asset("assets/images/dot_center.png")),
                        TextSpan(text: '플러터 개발자'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 500,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Positioned(
                                          right: 20,
                                          top: 20,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              alignment: Alignment.topRight,
                                              child: Icon(Icons.close),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 340,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const Text('기획이 가능한 개발자입니다.'),
                                                const Text(
                                                    '백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다. 백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.백엔드, 웹프론트엔드, 앱개발까지 고루 가능한 개발자입니다.'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10)),
                      child: Container(
                        child: Text("소개글 읽기"),
                      ))
                ],
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/self_img1.png'))
                          // image: DecorationImage
                          // (image: Image.asset("/assets/images/self_img1.png")
                          // )
                          ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "연락처 보기",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text("합격 결과는 여기로 통보해주세요"),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        ContactDialog(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/page_move_icon.png'))
                            // )
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Card(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "개발실력이 더 궁금하다면?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("깃허브에서 커밋 로그를 보실 수 있어요!"),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/page_move_icon.png'))
                          // )
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/self_img2.png'))
                          // image: DecorationImage
                          // (image: Image.asset("/assets/images/self_img1.png")
                          // )
                          ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "육아크루 지원동기",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("이런 일을 하고 싶습니다."),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/page_move_icon.png'))
                          // )
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "My Keywords",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: keywordCardListData.map((item) {
                      var idx = keywordCardListData.indexOf(item);
                      return InkWell(
                        onTap: () {
                          // openKeywordDetailPopup(item);
                          _dialog(context, item);
                        },
                        child: Card(
                          color: Colors.green[300],
                          child: Container(
                              height: 200,
                              width: 150,
                              padding: EdgeInsets.all(12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      color: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      child: Text(
                                        "키워드${idx}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      item.keyword,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 20,
                                    ),
                                    Expanded(child: Text(item.content)),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: RotationTransition(
                                        turns: AlwaysStoppedAnimation(90 / 365),
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/images/page_move_icon.png'))
                                              // image: DecorationImage
                                              // (image: Image.asset("/assets/images/self_img1.png")
                                              // )
                                              ),
                                        ),
                                      ),
                                    ),
                                  ])),
                        ),
                      );
                    }).toList(),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
