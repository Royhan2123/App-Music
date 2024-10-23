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
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          elevation: 8,
          shadowColor: Colors.black,
        ),
      ),
    );
  }
}
