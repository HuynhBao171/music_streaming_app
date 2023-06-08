import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReapetedDoubleText extends StatelessWidget {
  String title;
  String subtitle;
  ReapetedDoubleText({super.key, required this.title,required this.subtitle,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Text(
            subtitle,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
