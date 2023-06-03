import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'widgets/repetitious_listening_history.dart';
import 'widgets/appbar_listeninghistory.dart';

class ListeningHistoryPage extends StatefulWidget {
  static String id = "ListeningHistory";
  @override
  State<ListeningHistoryPage> createState() => _ListeningHistoryPageState();
}

class _ListeningHistoryPageState extends State<ListeningHistoryPage> {
  bool trash = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarListeningHistory(() {
                    setState(() {
                      trash = true;
                    });
                    Navigator.pop(context);
                  }),
                ],
            body: MainBodyListeningHistory(trash)),
      ),
    );
  }
}

// ignore: must_be_immutable
class MainBodyListeningHistory extends StatelessWidget {
  bool trash;
  MainBodyListeningHistory(this.trash);

  @override
  Widget build(BuildContext context) {
    return trash
        ? FadeInLeft(
            delay: Duration(microseconds: 600),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Find all the tracks you\'ve listened to here",
                    style: TextStyle(
                        color: Color.fromARGB(255, 134, 134, 134),
                        fontWeight: FontWeight.w400))),
          )
        : ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "No. of Tracks",
                    style: TextStyle(color: Color.fromARGB(255, 134, 134, 134)),
                  ),
                ),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
                RepetitiousListeningHistory(),
              ],
            ),
          ]);
  }
}
