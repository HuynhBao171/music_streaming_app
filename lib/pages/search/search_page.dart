import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../core/api_client.dart';
import '../../model/playlist.dart';
import '../../model/song.dart';
import '../../widgets/appbar.dart';
import '../../widgets/song_listview_vertical.dart';
import '../PlaySong/play_song_page.dart';
import 'widgets/repetitious_search_result.dart';
import 'widgets/search_input_field.dart';

class SearchPage extends StatelessWidget {
  static String id = "Search";
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: NestedScrollView(
                headerSliverBuilder: (ctx, i) => [
                      CustomAppBar(
                        title: "Search",
                      ),
                    ],
                body: const MainBodySearch())),
      ),
    );
  }
}

class MainBodySearch extends StatefulWidget {
  const MainBodySearch({super.key});

  @override
  State<MainBodySearch> createState() => _MainBodySearchState();
}

class _MainBodySearchState extends State<MainBodySearch> {
  final ApiClient _apiClient = ApiClient();
  TextEditingController myController = TextEditingController();
  bool showResults = false;
  bool showRecentSearches = true;
  List<String> recentSearches = [];
  late List<Song> songsSearches=[];
  late Playlist playlistSearches = Playlist(
    id: 1,
    name: 'Search Results',
    profileId: '123',
    image: 'assets/images/demo.png',
  );

  void searchAPI(String query) async {
    songsSearches = await _apiClient.searchAPI(query);
  }

  void deleteSearchResult(int index) {
    setState(() {
      recentSearches.removeAt(index);
      if (recentSearches.isEmpty) {
        showRecentSearches = true;
      }
    });
  }

  void clearRecentSearches() {
    setState(() {
      recentSearches.clear();
      showRecentSearches = true;
    });
  }

  void selectSearchResult(String searchResult) {
    setState(() {
      myController.text = searchResult;
      searchAPI(searchResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    double currentHeight = MediaQuery.of(context).size.height;
    double currentWidth = MediaQuery.of(context).size.width;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (showResults)
                MaterialButton(
                  minWidth: 20,
                  shape: const CircleBorder(),
                  color: Colors.orange.shade300,
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      showResults = false;
                      myController.clear();
                    });
                  },
                ),
              Container(
                width: (showResults) ? currentWidth * 0.785 : currentWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SearchInputField(
                    myController: myController,
                    hintText: "What do you want to listen to?",
                    borderRadius: 5,
                    onSubmitted: (query) {
                      if (query != null) {
                        setState(() {
                          recentSearches.add(query);
                          showRecentSearches = false;
                          showResults = true;
                        });
                        searchAPI(query);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 18.0),
            child: Text(
              (showResults) ? "Search Results" : "Recently Search",
              style: const TextStyle(
                fontSize: 28.0,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            // height: currentHeight,
            child: (showResults)
                ? Expanded(
                child: ListView.builder(
                  itemCount: songsSearches.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('${songsSearches?[index].image}'),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: ((context) => PlaySongPage(
                                          initialIndex: index,
                                          playlist: songsSearches, nameList: playlistSearches.name,
                                          // song: playlist.songs[index], dominantColor: Colors.amber,
                                        ))));
                                  },
                                  icon: const Icon(Icons.play_arrow) )
                              ,
                            ),
                          ],
                        ),

                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${songsSearches?[index].name}'),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '${songsSearches?[index].profileId}',
                              style: const TextStyle(
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
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' 4:26'),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                        Expanded(child: Container()),
                        const Icon(Icons.more_vert, color: Color.fromARGB(255, 134, 134, 134))
                      ],
                    );
                  }),
                )
                : SizedBox(
                    child: showRecentSearches
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Column(
                                children: [
                                  FadeInDown(
                                    delay: const Duration(microseconds: 300),
                                    from: 30,
                                    child: const Text(
                                      "Search",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  FadeInDown(
                                    delay: const Duration(microseconds: 600),
                                    from: 60,
                                    child: const Text(
                                      "Find artists, tracks, albums and playlists.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: recentSearches.length,
                                  itemBuilder: (context, index) {
                                    return RepetitiousSearchResult(
                                      searchResult: recentSearches[index],
                                      onDelete: () => deleteSearchResult(index),
                                      onTap: () => selectSearchResult(
                                          recentSearches[index]),
                                    );
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    clearRecentSearches();
                                  },
                                  child: const Text(
                                    "Clear search history",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
          )
        ]);
  }
}
