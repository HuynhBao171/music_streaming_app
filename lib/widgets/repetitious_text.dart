import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RepetitiousText extends StatelessWidget {
  String title;
  RepetitiousText(this.title, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }
}
