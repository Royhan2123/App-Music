import 'package:application_music/bloc/auth_bloc/auth_bloc.dart';
import 'package:application_music/login_screen.dart';
import 'package:application_music/screen/bottom_navigation.dart';
import 'package:application_music/style/stylesheet.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late VideoPlayerController _controller;
  bool isLoading = true;
  String videoUrl = '';

  @override
  void initState() {
    super.initState();
    _loadVideoFromFirebase();
  }

  Future<void> _loadVideoFromFirebase() async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child(
            'mp4/splash.mp4',
          );
      String url = await ref.getDownloadURL();

      setState(() {
        videoUrl = url;
      });

      _controller = VideoPlayerController.network(
        videoUrl,
      )..initialize().then((_) {
          setState(() {
            isLoading = false;
          });
          _controller.setLooping(true);
          _controller.play();
        });
    } catch (e) {
      throw Exception(
        "Error: $e",
      );
    }
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
        body: Stack(
          children: [
            video(),
            body(),
          ],
        ),
      ),
    );
  }

  Widget video() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(
                _controller,
              ),
            ),
    );
  }

  Widget body() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome Music Player",
            style: txtWhite.copyWith(
              fontSize: 25,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                260,
                45,
              ),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.purple,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: Text(
              "SignIn",
              style: txtWhite,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccesGoogle) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigation()),
                  (route) => false,
                );
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.error,
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    260,
                    45,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.cyan,
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(AuthCheckGoogle());
                },
                label: Text(
                  "Login With Google",
                  style: txtBlack.copyWith(fontSize: 14),
                ),
                icon: Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/google.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                260,
                45,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.cyan,
            ),
            onPressed: () {},
            label: Text(
              "Login With Phone Number",
              style: txtBlack.copyWith(
                fontSize: 14,
              ),
            ),
            icon: const Icon(
              Icons.phone_android_rounded,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
