import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

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
                    return GestureDetector(onTap: () {}, child: Text("이력서"));
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
      Row(
        children: [
          GestureDetector(
              onTap: () {
                showModal(context);
              },
              child: Text("이력서")),
        ],
      )
    ]);
  }
}
