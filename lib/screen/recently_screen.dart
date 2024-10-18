import 'dart:ui';

import 'package:application_music/model/recently_played_models.dart';
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
          ],
        ),
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
              style: txtBlack,
            ),
          ],
        ),
      ],
    );
  }
}
