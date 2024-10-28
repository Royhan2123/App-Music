import 'package:application_music/model/recently_played_models.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10), 
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose(); 
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
      leading: const Icon(
        Icons.arrow_back_ios_rounded,
        size: 25,
        color: Colors.white,
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
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.recently.image!.first),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
