import 'package:flutter/material.dart';

import '../../widgets/appbar.dart';
import 'widgets/below_upload_section.dart';
import 'widgets/follow_artist_section.dart';
import 'widgets/repetitious_double_text.dart';
import 'widgets/repetitious_listview.dart';
import 'widgets/repetitious_text.dart';
import 'widgets/upload_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBar(title: "Home"),
                ],
            body: MainBody()),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        ReapetedDoubleText(
            title: "More of what you like",
            subtitle: "Suggestions based on what you\'ve liked or played"),
        SizedBox(
          height: 5,
        ),
        RepetitiousListView(),
        SizedBox(
          height: 10,
        ),
        RepetitiousText("Recently Played"),
        SizedBox(
          height: 5,
        ),
        RepetitiousListView(),
        SizedBox(
          height: 10,
        ),
        ReapetedDoubleText(
            title: "The Uplooad",
            subtitle: "Newly posted tracks. Just for you"),
        UploadSectionWidget(),
        BelowUploadSectionWidet(),
        SizedBox(
          height: 10,
        ),
        ReapetedDoubleText(
            title: "Artist You Should Follow",
            subtitle: "Based on your listening history"),
        SizedBox(
          height: 5,
        ),
        FollowArtistSection(),
        SizedBox(
          height: 5,
        ),
        ReapetedDoubleText(
            title: "Party",
            subtitle: "Popular playlists from the App community"),
        SizedBox(
          height: 10,
        ),
        RepetitiousListView(),
        SizedBox(
          height: 5,
        ),
        ReapetedDoubleText(
            title: "Sleep",
            subtitle: "Popular playlists from the App community"),
        SizedBox(
          height: 10,
        ),
        RepetitiousListView(),
        SizedBox(
          height: 5,
        ),
        ReapetedDoubleText(
            title: "Chill",
            subtitle: "Popular playlists from the App community"),
        SizedBox(
          height: 10,
        ),
        RepetitiousListView(),
        SizedBox(
          height: 5,
        ),
        ReapetedDoubleText(
            title: "Charts: New & hot",
            subtitle: "Up-and-coming tracks on App"),
        UploadSectionWidget(),
      ],
    );
  }
}