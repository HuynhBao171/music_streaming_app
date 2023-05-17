import 'package:flutter/material.dart';

import '../../widgets/repetitious_listview_horizontal.dart';
import '../../widgets/repetitious_listview_vertical.dart';
import '../../widgets/repetitious_text.dart';
import '../listeningHistory/listening_history.dart';
import 'widgets/appbar_upload.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarUpload(title: "Upload"),
                ],
            body: MainBodyUpload()),
      ),
    );
  }
}

class MainBodyUpload extends StatefulWidget {
  const MainBodyUpload({super.key});

  @override
  State<MainBodyUpload> createState() => _MainBodyUploadState();
}

class _MainBodyUploadState extends State<MainBodyUpload> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}