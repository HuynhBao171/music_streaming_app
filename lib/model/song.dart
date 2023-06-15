class Song {
  int? id;
  String? name;
  String? url;
  String? profileId;
  String? coverUrl;

  Song({this.id, this.name, this.url, this.profileId, this.coverUrl});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    profileId = json['profileId'];
    coverUrl = json['coverUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['profileId'] = this.profileId;
    data['coverUrl'] = this.coverUrl;
    return data;
  }

  static List<Song> songs = [
    Song(
      name: 'Glass',
      profileId: 'Huynh',
      url: 'assets/music/glass.mp3',
      coverUrl: 'assets/images/glass.jpeg',
    ),
    Song(
      name: 'Illusions',
      profileId: 'Huynh',
      url: 'assets/music/illusions.mp3',
      coverUrl: 'assets/images/illusions.jpeg',
    ),
    Song(
      name: 'Pray',
      profileId: 'Huynh',
      url: 'assets/music/pray.mp3',
      coverUrl: 'assets/images/pray.jpeg',
    ),
  ];
}