
class Playlist {
  int? id;
  String? name;
  String? profileId;
  String? image;

  Playlist({this.id, this.name, this.profileId, this.image});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileId = json['profileId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profileId'] = profileId;
    data['image'] = image;
    return data;
  }


  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['profileId'] = profileId;
  //   return data;
  // }
  // static List<Playlist> dailyMix = [
  //   Playlist(
  //       id: 1,
  //       profileId: "Huynh",
  //       name: "Daily Mix 1",
  //       coverUrl: 'assets/images/Daily_Mix_1.png',
  //       songs: Song.songs),
  //   Playlist(
  //       id: 2,
  //       profileId: "Huynh",
  //       name: "Daily Mix 2",
  //       coverUrl: 'assets/images/Daily_Mix_2.png',
  //       songs: Song.songs),
  //   Playlist(
  //       id: 3,
  //       profileId: "Huynh",
  //       name: "Daily Mix 3",
  //       coverUrl: 'assets/images/Daily_Mix_3.png',
  //       songs: Song.songs),
  //   Playlist(
  //       id: 4,
  //       profileId: "Huynh",
  //       name: "Daily Mix 4",
  //       coverUrl: 'assets/images/Daily_Mix_4.png',
  //       songs: Song.songs),
  //   Playlist(
  //       id: 5,
  //       profileId: "Huynh",
  //       name: "Daily Mix 5",
  //       coverUrl: 'assets/images/Daily_Mix_5.png',
  //       songs: Song.songs),
  // ];
  // static List<Playlist> album = [
  //   Playlist(
  //       id: 1,
  //       profileId: "Huynh",
  //       name: "Desi Hip-Hop",
  //       coverUrl: 'assets/images/Album_1.jpg',
  //       songs: Song.songs),
  //   Playlist(
  //       id: 2,
  //       profileId: "Huynh",
  //       name: "English Hip-Hop",
  //       coverUrl: 'assets/images/Album_2.jpg',
  //       songs: Song.songs),
  //   Playlist(
  //       id: 3,
  //       profileId: "Huynh",
  //       name: "English Songs",
  //       coverUrl: 'assets/images/Album_3.jpg',
  //       songs: Song.songs),
  //   Playlist(
  //       id: 4,
  //       profileId: "Huynh",
  //       name: "Classical Songs",
  //       coverUrl: 'assets/images/Album_4.jpg',
  //       songs: Song.songs),
  // ];
}

  
