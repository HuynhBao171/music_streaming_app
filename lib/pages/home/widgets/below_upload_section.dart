
import 'package:flutter/material.dart';

class BelowUploadSectionWidet extends StatelessWidget {
  const BelowUploadSectionWidet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5,left: 10),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor : Colors.black ,
          ),
          const SizedBox(width: 10,),
          const Text("Based on your listening history", style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
