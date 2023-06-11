import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar.dart';
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
  TextEditingController myController = TextEditingController();
  bool showResults = true;
  List<String> recentSearches = [];

  void deleteSearchResult(int index) {
    setState(() {
      recentSearches.removeAt(index);
      if (recentSearches.isEmpty) {
        showResults = true;
      }
    });
  }

  void clearRecentSearches() {
    setState(() {
      recentSearches.clear();
      showResults = true;
    });
  }

  void selectSearchResult(String searchResult) {
    setState(() {
      // selectedSearchResult = searchResult;
      myController.text = searchResult;
      // searchAPI(searchResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: SearchInputField(
            myController: myController,
            hintText: "What do you want to listen to?",
            borderRadius: 5,
            onSubmitted: (query) {
              if (query != null) {
                setState(() {
                  recentSearches.add(query);
                  showResults = false;
                });
                //searchAPI(query);
              }
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        showResults
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
                    children: [
                      FadeInDown(
                        delay: const Duration(microseconds: 300),
                        from: -30,
                        child: const Text(
                          "Search",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FadeInDown(
                        delay: const Duration(microseconds: 600),
                        from: -60,
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
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "History",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: recentSearches.length,
                      itemBuilder: (context, index) {
                        return RepetitiousSearchResult(
                          searchResult: recentSearches[index],
                          onDelete: () => deleteSearchResult(index),
                          onTap: () =>
                              selectSearchResult(recentSearches[index]),
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
              )
      ],
    );
  }
}
