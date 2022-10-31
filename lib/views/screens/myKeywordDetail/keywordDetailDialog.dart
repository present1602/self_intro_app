// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../../model/MyKeyword.dart';

// class MyKeywordDetailDialog extends StatefulWidget {
//   const MyKeywordDetailDialog({super.key});

//   @override
//   State<MyKeywordDetailDialog> createState() => _MyKeywordDetailDialogState();
// }

// class _MyKeywordDetailDialogState extends State<MyKeywordDetailDialog> {
//   @override
//   Widget build(BuildContext context) {
//     Future<void> _dialog(BuildContext context, MyKeyword myKeyword) async {
//       return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Scaffold(
//             body: Stack(
//               children: <Widget>[
//                 InkWell(
//                   onTap: () => Navigator.of(context).pop(),
//                   child: Positioned(
//                     right: 30,
//                     top: 30,
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       alignment: Alignment.topRight,
//                       child: Icon(Icons.close),
//                     ),
//                   ),
//                 ),
//                 // Text("body ${myKeyword.keyword}")

//                 // Column(
//                 //   children: <Widget>[
//                 //     Expanded(
//                 //       flex: 3,
//                 //       child: Container(
//                 //         color: Colors.green,
//                 //       ),
//                 //     ),
//                 //     Expanded(
//                 //       flex: 7,
//                 //       child: Container(
//                 //         color: Colors.yellow,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // )
//               ],
//             ),
//           );
//         },
//       );
//     }
//   }
// }
