import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 15),
        leading: Icon(icon, color: Color.fromARGB(255, 134, 134, 134), size: 32),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined, color: Color.fromARGB(255, 134, 134, 134), size: 46,),
        title: Text(title, style: const TextStyle(
          fontSize: 17,
          color: Color.fromARGB(255, 134, 134, 134),
          fontWeight: FontWeight.w600
        )),
      ),
    );
  }
}