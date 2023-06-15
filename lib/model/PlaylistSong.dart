class PlaylistSong {
  int? id;
  int? playlistId;
  int? songId;

  PlaylistSong({this.id, this.playlistId, this.songId});

  PlaylistSong.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playlistId = json['playlistId'];
    songId = json['SongId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['playlistId'] = playlistId;
    data['SongId'] = songId;
    return data;
  }
}