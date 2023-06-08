import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RepetitiousMusicCover extends StatelessWidget {
  Widget? privateIcon;
  RepetitiousMusicCover(this.privateIcon, {super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      width: currentWidth,
      height: currentHeight / 9,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 6),
            width: 80,
            height: 80,
            child: Stack(children: [
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromARGB(255, 134, 134, 134)),
                      color: const Color.fromARGB(255, 200, 200, 200),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromARGB(255, 134, 134, 134)),
                      color: const Color.fromARGB(255, 200, 200, 200),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromARGB(255, 134, 134, 134)),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ]),
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
                  Icons.favorite,
                  color: Color.fromARGB(255, 134, 134, 134),
                  size: 15,
                ),
                RichText(
                  text: const TextSpan(
                    text: '869 ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 134, 134, 134),
                      fontSize: 13,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '•',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' No. of tracks'),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                privateIcon ?? Container(),
              ]),
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.more_vert, color: Color.fromARGB(255, 134, 134, 134))
        ],
      ),
    );
  }
}
