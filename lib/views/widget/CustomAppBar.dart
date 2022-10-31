import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String pageTitle;
  final int pageIndex;

  const CustomAppBar({required this.pageTitle, required this.pageIndex});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(pageTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Navigator.of(context).maybePop();
          },
        ));
  }
}

// AppBar(
//   centerTitle: true,
//   title: Text(pageTitle, style: TextStyle(color: Colors.black)),
//   elevation: 0,
//   backgroundColor: Colors.white,
//   leading: IconButton(
//     icon: Icon(Icons.arrow_back),
//     color: Colors.black,
//     onPressed: () {
//       // Navigator.of(context).maybePop();
//     },
//   ),
// ),

// import 'package:flutter/material.dart';

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   CustomAppBar({required int key})
//       : preferredSize = Size.fromHeight(kToolbarHeight),
//         super(key: key);

//   @override
//   final Size preferredSize; // default is 56.0

//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text('Emotely'),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/container.dart';
// // import 'package:flutter/src/widgets/framework.dart';

// // class CustomAppBar extends StatelessWidget {
// //   // const CustomAppBar({super.key});
// //   int pageIndex = 0;
// //   CustomAppBar(int pageIndex) {
// //     this.pageIndex = pageIndex;
// //   }

// //   getPageTitle(int index) {
// //     if (index == 1) {
// //       return "깃허브";
// //     } else if (index == 2) {
// //       return "지원동기";
// //     } else if (index == 3) {
// //       return "경력기술서";
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AppBar(
// //       title: Text(getPageTitle(pageIndex)),
// //     );
// //   }
// // }
