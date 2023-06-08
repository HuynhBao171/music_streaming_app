import 'package:music_streaming_app/model/song.dart';

class Playlist {
  int? id;
  String? name;
  List<Song> songs;
  String? profileId;
  String? coverUrl;

  Playlist({required this.id,required this.name, this.profileId, required this.songs, required this.coverUrl});

  // Playlist.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   profileId = json['profileId'];
  //   coverUrl = json['iconUrl'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['profileId'] = this.profileId;
  //   data['iconUrl'] = this.coverUrl;
  //   return data;
  // }
  static List<Playlist> dailyMix = [
  Playlist(id: 1, profileId: "Huynh", name: "Daily Mix 1", coverUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/2/26/Black_Pink_-_Square_Up_artwork.png/220px-Black_Pink_-_Square_Up_artwork.png", songs: Song.songs),
  Playlist(id: 2, profileId: "Huynh", name: "Daily Mix 2", coverUrl: 'https://i.scdn.co/image/ab67616d0000b273e960ebdd55eff9ee95dc85fb', songs: Song.songs),
  Playlist(id: 3, profileId: "Huynh", name: "Daily Mix 3", coverUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLyC_WrqH3dfkrifv9Uj494gjXGUzDDb4ydQ&usqp=CAU', songs: Song.songs),
  Playlist(id: 4, profileId: "Huynh", name: "Daily Mix 4", coverUrl: 'https://www.musicinminnesota.com/wp-content/uploads/2022/01/Photo-from-Adobe-Stock.jpg', songs: Song.songs),
  Playlist(id: 5, profileId: "Huynh", name: "Daily Mix 5",  coverUrl: 'https://cdn.dribbble.com/users/905938/screenshots/3441423/cover-4-vinyl-dribbble.jpg', songs: Song.songs),
];
  static List<Playlist> album = [
  Playlist(id: 1, profileId: "Huynh", name: "Desi Hip-Hop", coverUrl: "https://e1.pxfuel.com/desktop-wallpaper/866/656/desktop-wallpaper-hip-hop-rapper-in-pinterest-krsna.jpg", songs: Song.songs),
  Playlist(id: 2, profileId: "Huynh", name: "English Hip-Hop", coverUrl: 'https://e1.pxfuel.com/desktop-wallpaper/866/656/desktop-wallpaper-hip-hop-rapper-in-pinterest-krsna.jpg', songs: Song.songs),
  Playlist(id: 3, profileId: "Huynh", name: "English Songs", coverUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a5/Closer_%28featuring_Halsey%29_%28Official_Single_Cover%29_by_The_Chainsmokers.png', songs: Song.songs),
  Playlist(id: 4, profileId: "Huynh", name: "Classical Hindi Songs", coverUrl: 'https://img.wynk.in/unsafe/200x200/filters:no_upscale():strip_exif():format(jpg)/http://s3.ap-south-1.amazonaws.com/discovery-prod-arsenal/arsenal/artworks/64183928c91f9d41080a2364/COLLECTION_464298048435.png', songs: Song.songs),
];
}