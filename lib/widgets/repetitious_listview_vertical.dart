import 'package:flutter/material.dart';

class RepetitiousListViewVertical extends StatelessWidget {
  const RepetitiousListViewVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      width: currentWidth,
      height: 240,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return Container(
              margin: EdgeInsets.all(10),
              width: currentWidth / 2.5,

              // color: Colors.yellow,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    width: 70,
                    height: 70,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("THE NAME OF MUSIC WITH A BIT INFO"),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "NAME OF ARTIST",
                        style: TextStyle(
                            color: Color.fromARGB(255, 134, 134, 134),
                            fontSize: 13.5,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(children: [
                        Icon(
                          Icons.play_arrow,
                          color: Color.fromARGB(255, 134, 134, 134),
                          size: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            text: '390K ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 134, 134, 134),
                              fontSize: 13,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: '•',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' 4:26'),
                            ],
                          ),
                        )
                      ]),
                    ],
                  ),
                  Expanded(child: Container()),
                  Icon(Icons.more_vert,
                      color: Color.fromARGB(255, 134, 134, 134))
                ],
              ),
            );
          }),
    );
  }
}
