import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitScreen extends StatelessWidget {
  const GitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: "https://github.com/present1602",
    );
  }
}
