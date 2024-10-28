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

class _MusicScreenState extends State<MusicScreen> {
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
        padding: const EdgeInsets.only(
          left: 15,
        ),
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
    return Container(

    );
  }
}
