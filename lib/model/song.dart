class Song {
  int? id;
  String? name;
  String? url;
  String? profileId;
  String? image;

  Song({this.id, this.name, this.url, this.profileId, this.image});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    profileId = json['profileId'];
    image = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['profileId'] = profileId;
    data['imageUrl'] = image;
    return data;
  }

  // static List<Song> songs = [
  //   Song(
  //     name: 'Glass',
  //     profileId: 'Huynh',
  //     url: 'assets/music/glass.mp3',
  //     coverUrl: 'assets/images/glass.jpeg',
  //   ),
  //   Song(
  //     name: 'Illusions',
  //     profileId: 'Huynh',
  //     url: 'assets/music/illusions.mp3',
  //     coverUrl: 'assets/images/illusions.jpeg',
  //   ),
  //   Song(
  //     name: 'Pray',
  //     profileId: 'Huynh',
  //     url: 'assets/music/pray.mp3',
  //     coverUrl: 'assets/images/pray.jpeg',
  //   ),
  // ];
}