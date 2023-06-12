import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../model/song.dart';
import '../../utils/color_utils.dart';

class PlaySongPage extends StatefulWidget {
  final List<Song> playlist;
  final String? nameList;
  final int initialIndex;

  PlaySongPage({
    Key? key,
    required this.playlist,
    required this.initialIndex,
    required this.nameList,
  }) : super(key: key);

  @override
  _PlaySongPageState createState() => _PlaySongPageState();
}

class _PlaySongPageState extends State<PlaySongPage> {
  late ConcatenatingAudioSource _playlist;
  late AudioPlayer _audioPlayer;
  late int _initialIndex;
  bool _isPlaying = true;
  Duration _duration = const Duration();
  Duration _position = const Duration();
  Color? _dominantColor;
  LoopMode _loopMode = LoopMode.off;
  bool _isShuffling = false;

  Future<Color> _updateDominantColor(ImageProvider _imageProvider) async {
    final dominantColor =
        await getDominantColor(_imageProvider, const Size(135, 135));
    return dominantColor;
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer();
    _playlist = ConcatenatingAudioSource(
      children: widget.playlist
          .map(
            (song) => AudioSource.uri(Uri.parse('asset:/${song.url}')),
          )
          .toList(),
    );
    _audioPlayer.setAudioSource(_playlist);

    _audioPlayer.durationStream.listen((newDuration) {
      setState(() {
        _duration = newDuration ?? const Duration();
      });
    });
    
    _audioPlayer.positionStream.listen((position) {
        setState(() {
          _position = position;
        });
    });

    _audioPlayer.currentIndexStream.listen((newIndex) {
      setState(() {
        _initialIndex = newIndex ?? 0;
      });
      _updateDominantColor(
        AssetImage(widget.playlist[_initialIndex].coverUrl.toString()),
      ).then((value) {
        setState(() {
          _dominantColor = value;
        });
      });
    });

    _audioPlayer.playbackEventStream.listen((event) {
      setState(() {
        _position = event.updatePosition;
        _duration = _audioPlayer.duration ?? const Duration();
      });
    });

    _audioPlayer.setLoopMode(_loopMode);
    _audioPlayer.seek(const Duration());
    _audioPlayer.play();
  }

  @override
  void initState() {
    super.initState();
    _initialIndex = widget.initialIndex;
    _initAudioPlayer();
  }

  @override
  void dispose() {
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

  void _next() {
    if (_initialIndex < widget.playlist.length - 1) {
      _initialIndex++;
    } else {
      _initialIndex = 0;
    }
    _isPlaying = true;
    _audioPlayer.seek(const Duration(), index: _initialIndex);
    _audioPlayer.play();
  }

  void _previous() {
    if (_initialIndex > 0) {
      _initialIndex--;
    } else {
      _initialIndex = widget.playlist.length - 1;
    }
    _isPlaying = true;
    _audioPlayer.seek(const Duration(), index: _initialIndex);
    _audioPlayer.play();
  }

  void _toggleLoop() {
    setState(() {
      switch (_loopMode) {
        case LoopMode.off:
          _loopMode = LoopMode.all;
          break;
        case LoopMode.all:
          _loopMode = LoopMode.one;
          break;
        case LoopMode.one:
          _loopMode = LoopMode.off;
          break;
      }
      _audioPlayer.setLoopMode(_loopMode);
    });
  }

  void _toggleShuffle() {
    setState(() {
      _isShuffling = !_isShuffling;
      if (_isShuffling) {
        _audioPlayer.setShuffleModeEnabled(true);
      } else {
        _audioPlayer.setShuffleModeEnabled(false);
      }
    });
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return '--:--';
    } else {
      String minutes = duration.inMinutes.toString().padLeft(2, '0');
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dominantColor ?? Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            widget.nameList.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    widget.playlist[_initialIndex].coverUrl.toString()),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              widget.playlist[_initialIndex].name.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              widget.playlist[_initialIndex].profileId.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4,
                thumbShape: const RoundSliderThumbShape(
                  disabledThumbRadius: 4,
                  enabledThumbRadius: 4,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 10,
                ),
                activeTrackColor: Colors.white.withOpacity(0.2),
                inactiveTrackColor: Colors.white,
                thumbColor: Colors.white,
                overlayColor: Colors.white,
              ),
              child: Slider(
                min: 0,
                max: _duration.inSeconds.toDouble(),
                value: _position.inSeconds.toDouble(),
                onChanged: (value) {
                  _audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_position),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  _formatDuration(_duration),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle),
                  color: _isShuffling ? Colors.green : Colors.white,
                  onPressed: _toggleShuffle,
                  iconSize: 24,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  color: Colors.white,
                  onPressed: _previous,
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: _isPlaying ? _pause : _play,
                  icon: _isPlaying
                      ? const Icon(Icons.pause_circle_filled)
                      : const Icon(Icons.play_circle_filled),
                  color: Colors.white,
                  iconSize: 96,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  color: Colors.white,
                  onPressed: _next,
                  iconSize: 50,
                ),
                IconButton(
                  icon: _loopMode == LoopMode.off
                      ? const Icon(Icons.repeat)
                      : _loopMode == LoopMode.all
                          ? const Icon(Icons.repeat)
                          : const Icon(Icons.repeat_one),
                  color:
                      _loopMode == LoopMode.off ? Colors.white : Colors.green,
                  onPressed: _toggleLoop,
                  iconSize: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
