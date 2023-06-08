import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class RepetitiousSearchResult extends StatelessWidget {
  String searchResult;
  RepetitiousSearchResult({super.key, required this.searchResult,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            searchResult,
            style: TextStyle(
                fontSize: 17, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
          ),
          Icon(LineIcons.trash, color: Colors.grey.shade600),

        ],
      ),
    );
  }
}
