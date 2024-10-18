import 'package:application_music/model/recently_played_models.dart';
import 'package:application_music/screen/recently_screen.dart';
import 'package:flutter/material.dart';

class CardRecentlyPlayed extends StatelessWidget {
  final RecentlyPlayedModels recently;
  const CardRecentlyPlayed({
    super.key,
    required this.recently,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecentlyScreen(
                    recently: recently,
                  ),
                ),
              );
            },
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16,
                ),
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                    recently.image!.first,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              recently.name!.first,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
