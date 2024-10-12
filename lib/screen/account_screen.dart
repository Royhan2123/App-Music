import 'package:application_music/bloc/auth_bloc/auth_bloc.dart';
import 'package:application_music/login_screen.dart';
import 'package:application_music/style/stylesheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(
          20,
        ),
        children: [
          header(),
          avatarCircle(),
          body(),
          logout(),
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: txtBlack,
          ),
          Text(
            "royhans@gmail.com",
            style: txtBlack2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Phone Number",
            style: txtBlack,
          ),
          Text(
            "628127763512",
            style: txtBlack2,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.grey.shade500,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.favorite_border_outlined,
                        size: 25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "120 songs",
                        style: txtBlack.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.grey.shade500,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.queue_music_sharp,
                        size: 25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "12 Playlist",
                        style: txtBlack.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.grey.shade500,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.library_music,
                        size: 25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "3 Artist",
                        style: txtBlack.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Setting",
            style: txtBlack,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Music Languange(s)",
                style: txtBlack,
              ),
              Text(
                "English, Indonesia",
                style: txtBlack2,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Streaming Quality",
                style: txtBlack,
              ),
              Text(
                "HD",
                style: txtBlack2,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Download Quality",
                style: txtBlack,
              ),
              Text(
                "HD",
                style: txtBlack2,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Equalizer",
                    style: txtBlack,
                  ),
                  Text(
                    "Adjust audio settings",
                    style: txtBlack2,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Auto-Play",
                style: txtBlack,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: isSwitched ? Colors.purple : Colors.grey,
                  ),
                  child: AnimatedAlign(
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    alignment: isSwitched
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Show Lyrics on Player",
                style: txtBlack,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: isSwitched ? Colors.purple : Colors.grey,
                  ),
                  child: AnimatedAlign(
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    alignment: isSwitched
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My Profile",
          style: txtBlack.copyWith(
            fontSize: 17,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text(
            "Edit",
            style: txtBlack,
          ),
          icon: const Icon(
            Icons.edit,
            size: 20,
            color: Colors.black,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade400,
            minimumSize: const Size(
              100,
              45,
            ),
          ),
        ),
      ],
    );
  }

  Widget avatarCircle() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(
              top: 20,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://web-portofolio-royhan.vercel.app/assets/img/hero/royhan.png",
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                ),
              ],
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Royhan",
            style: txtBlack.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget logout() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
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
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 40,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(
                double.infinity,
                40,
              ),
              foregroundColor: Colors.purple,
              animationDuration: const Duration(
                seconds: 5,
              ),
            ),
            onPressed: () {
              context.read<AuthBloc>().add(
                    AuthLogout(),
                  );
            },
            child: const Text(
              "Log out",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
