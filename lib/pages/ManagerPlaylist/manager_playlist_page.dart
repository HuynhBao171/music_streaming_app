
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../widgets/repetitious_listview_vertical.dart';
import 'widgets/appbar_playlist.dart';

class ManagerPlaylistPage extends StatefulWidget {
  static String id = "Playlist";
  const ManagerPlaylistPage({super.key});

  @override
  State<ManagerPlaylistPage> createState() => _ManagerPlaylistPageState();
}

class _ManagerPlaylistPageState extends State<ManagerPlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarPlaylist(title: "Playlist"),
                ],
            body: const MainBodyPlaylist()),
      ),
    );
  }
}

class MainBodyPlaylist extends StatefulWidget {
  const MainBodyPlaylist({super.key});

  @override
  State<MainBodyPlaylist> createState() => _MainBodyPlaylistState();
}

class _MainBodyPlaylistState extends State<MainBodyPlaylist>{
  final newPlaylistNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: currentWidth,
      height: currentHeight,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                _uploadPlaylist();
              },
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(LineIcons.plusCircle),
                    ),
                  ),
                ),
                const Text("Create playlist")
              ],
            ),
            RepetitiousListViewVertical(
              height: currentHeight,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadPlaylist() async {
    // Show a bottom sheet
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add new Playlist'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: newPlaylistNameController,
                    decoration: const InputDecoration(
                      hintText: "Playlist name",
                    ),
                  ),
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
                MaterialButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ));
  }
}
