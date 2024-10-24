import 'dart:ui';
import 'package:application_music/model/recently_played_models.dart';
import 'package:application_music/screen/music_screen.dart';
import 'package:application_music/style/stylesheet.dart';
import 'package:flutter/material.dart';

class RecentlyScreen extends StatefulWidget {
  final RecentlyPlayedModels recently;
  const RecentlyScreen({
    super.key,
    required this.recently,
  });

  @override
  State<RecentlyScreen> createState() => _RecentlyScreenState();
}

class _RecentlyScreenState extends State<RecentlyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            header(),
            body(),
            cardMusic(),
          ],
        ),
      ),
    );
  }

  Widget cardMusic() {
    return Container(
      margin: const EdgeInsets.all(
        20,
      ),
      padding: const EdgeInsets.all(
        15,
      ),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(
                  widget.recently.image!.first,
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recently.artist!.first,
                style: txtBlack.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.recently.name!.first,
                style: txtBlack.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              minimumSize: const Size(
                60,
                60,
              ),
              backgroundColor: Colors.grey.shade200,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (route) => MusicScreen(
                    recently: widget.recently,
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.play_arrow_rounded,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          width: double.infinity,
          height: 350,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                widget.recently.image!.first,
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: Container(
                  color: Colors.black.withOpacity(
                    0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: headerContainer(),
        ),
        Positioned(
          left: 15,
          top: 15,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.arrow_back_sharp,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget headerContainer() {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              15,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 1,
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                widget.recently.image!.first,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.recently.artist!.first,
              style: txtBlack3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.recently.name!.first,
              style: txtWhite.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget body() {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deskripsi",
            style: txtBlack,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.recently.deskripsi!.first,
            style: txtBlack2.copyWith(
              fontSize: 15,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
