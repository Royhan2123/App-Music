import 'package:audioplayers/audioplayers.dart';
import 'package:application_music/model/recently_played_models.dart';
import 'package:application_music/style/stylesheet.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  final RecentlyPlayedModels recently;

  const MusicScreen({
    super.key,
    required this.recently,
  });

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _audioPlayer = AudioPlayer();

    // Update the UI when the player position changes
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });

    // Update total duration of the song
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = duration;
      });
    });
  }

  Future<void> playMusic() async {
    await _audioPlayer.play(
      UrlSource(
        widget.recently.music!.first,
      ),
    );
    setState(() {
      isPlaying = true;
    });
  }

  Future<void> pauseMusic() async {
    await _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            head(),
            body(),
          ],
        ),
      ),
    );
  }

  Widget head() {
    return AppBar(
      backgroundColor: Colors.black,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 25,
          color: Colors.white,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          widget.recently.artist!.first,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          RotationTransition(
            turns: _controller,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.recently.image!.first,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.recently.name!.first,
            style: txtBlack,
          ),
          const SizedBox(height: 20),

          // Slider for audio position
          Slider(
            value: currentPosition.inSeconds.toDouble(),
            max: totalDuration.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await _audioPlayer.seek(position);
              setState(() {
                currentPosition = position;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDuration(currentPosition)),
              Text(formatDuration(totalDuration)),
            ],
          ),
          const SizedBox(height: 20),

          // Play/Pause button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 60,
                icon: Icon(
                  isPlaying ? Icons.pause_circle : Icons.play_circle,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (isPlaying) {
                    pauseMusic();
                  } else {
                    playMusic();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
