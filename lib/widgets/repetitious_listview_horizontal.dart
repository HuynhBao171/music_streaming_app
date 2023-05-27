import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class RepetitiousListViewHorizontal extends StatefulWidget {
  const RepetitiousListViewHorizontal({Key? key}) : super(key: key);

  @override
  _RepetitiousListViewHorizontalState createState() =>
      _RepetitiousListViewHorizontalState();
}

class _RepetitiousListViewHorizontalState
    extends State<RepetitiousListViewHorizontal> {
  Color? _dominantColor;
  ImageProvider _imageProvider = AssetImage('assets/images/demo.png');

  @override
  void initState() {
    super.initState();
    _updateDominantColor();
  }

  Future<void> _updateDominantColor() async {
    final dominantColor =
        await getDominantColor(_imageProvider, Size(135, 135));
    setState(() {
      _dominantColor = dominantColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      width: currentWidth,
      height: currentHeight / 3.6,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.all(5),
            width: currentWidth / 2.5,
            child: Column(
              children: [
                Container(
                  width: currentWidth / 2.5,
                  height: currentHeight / 4.8,
                  child: _dominantColor == null
                      ? Center(
                          child: Positioned(
                            bottom: 15,
                            right: 16,
                            child: Container(
                              width: 135,
                              height: 135,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 3,
                                right: 3,
                                child: Container(
                                  width: 125,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _dominantColor!.withOpacity(0.1),
                                    ),
                                    color: _dominantColor!.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 9,
                                right: 9,
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _dominantColor!.withOpacity(0.1),
                                    ),
                                    color: _dominantColor!,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 16,
                                child: Container(
                                  width: 135,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.1)),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: _imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name of artist • song',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      'Related tracks',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
