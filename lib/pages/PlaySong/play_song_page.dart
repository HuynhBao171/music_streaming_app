import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../model/song.dart';

class PlaySongPage extends StatefulWidget {
  final Song song;
  final Color? dominantColor;

  PlaySongPage({super.key, required this.song, required this.dominantColor});

  @override
  _PlaySongPageState createState() => _PlaySongPageState();
}

class _PlaySongPageState extends State<PlaySongPage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool _mounted = false;

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.durationStream.listen((duration) {
      if (_mounted) { 
        setState(() {
          _duration = duration ?? const Duration();
        });
      }
    });
    _audioPlayer.positionStream.listen((position) {
      if (_mounted) { 
        setState(() {
          _position = position;
        });
      }
    });
  }

   @override
  void initState() {
    super.initState();
    _mounted = true; 
    _initAudioPlayer();
    _audioPlayer.setAsset(widget.song.url.toString()).then((value) {
      if (_mounted) { 
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _mounted = false; 
    _audioPlayer.dispose();
    super.dispose();
  }

  void _play() {
    _audioPlayer.play();
    setState(() {
      _isPlaying = true;
    });
  }

  void _pause() {
    _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  void _fastForward() {
    _audioPlayer.seek(_position + const Duration(seconds: 10));
  }

  void _rewind() {
    _audioPlayer.seek(_position - const Duration(seconds: 10));
  }

  String _formatDuration(Duration duration) {
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.dominantColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.song.name.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.song.coverUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 5),
            Slider(
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  _audioPlayer.seek(Duration(seconds: value.toInt()));
                });
              },
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(_position),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _formatDuration(_duration),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.fast_rewind),
                  color: Colors.white,
                  onPressed: _rewind,
                ),
                IconButton(
                  iconSize: 50,
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  color: Colors.white,
                  onPressed: _isPlaying ? _pause : _play,
                ),
                IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.fast_forward),
                  color: Colors.white,
                  onPressed: _fastForward,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
