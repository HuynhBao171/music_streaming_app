import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// ignore: must_be_immutable
class RepetitiousSearchResult extends StatelessWidget {
  String searchResult;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  RepetitiousSearchResult({
    super.key,
    required this.searchResult,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Stack(
          children: [
            Text(
              searchResult,
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: onDelete,
                child: Icon(LineIcons.trash, color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
