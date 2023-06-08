import 'package:flutter/material.dart';

class RepetitiousListViewVertical extends StatelessWidget {
  double height;
  RepetitiousListViewVertical({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: currentWidth,
      height: height,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              width: currentWidth / 2.5,

              // color: Colors.yellow,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    width: 70,
                    height: 70,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("THE NAME OF MUSIC WITH A BIT INFO"),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "NAME OF ARTIST",
                        style: TextStyle(
                            color: Color.fromARGB(255, 134, 134, 134),
                            fontSize: 13.5,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Color.fromARGB(255, 134, 134, 134),
                          size: 15,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: '390K ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 134, 134, 134),
                              fontSize: 13,
                            ),
                            children: <TextSpan>[
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
                  const Icon(Icons.more_vert,
                      color: Color.fromARGB(255, 134, 134, 134))
                ],
              ),
            );
          }),
    );
  }
}
