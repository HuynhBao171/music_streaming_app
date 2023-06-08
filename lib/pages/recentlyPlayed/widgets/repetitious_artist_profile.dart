import 'package:flutter/material.dart';

class RepetitiousArtistProfile extends StatelessWidget {
  const RepetitiousArtistProfile({Key? key}) : super(key: key);

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
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/profile.png"))),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("NAME OF ARTIST"),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "Location",
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
                  Icons.person,
                  color: Color.fromARGB(255, 134, 134, 134),
                  size: 15,
                ),
                RichText(
                  text: const TextSpan(
                    text: '121 ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 134, 134, 134),
                      fontSize: 13,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Followers',
                          style: TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  ),
                )
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
