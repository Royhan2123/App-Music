import 'package:application_music/bloc/storage_bloc/storage_bloc.dart';
import 'package:application_music/bloc/user_bloc/user_bloc.dart';
import 'package:application_music/model/featuring_today_models.dart';
import 'package:application_music/model/recently_played_models.dart';
import 'package:application_music/style/stylesheet.dart';
import 'package:application_music/widget/card_feature_today.dart';
import 'package:application_music/widget/card_recently_played.dart';
import 'package:application_music/widget/card_relax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final list = const [
    ForYou(),
    Relax(),
    Workout(),
    Travel(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: list.length,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {});
    });
    context.read<StorageBloc>().add(
          GetFeaturingToday(),
        );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: list.length,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                padding: const EdgeInsets.all(
                  20,
                ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              if (state is UserLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is UserSucces) {
                                return Text(
                                  "Hi, ${state.user.name}",
                                  style: txtBlack3,
                                );
                              }
                              return Text(
                                "Hello Royhan",
                                style: txtBlack2,
                              );
                            },
                          ),
                          Text(
                            "How are you today",
                            style: txtGrey,
                          ),
                        ],
                      ),
                      Container(
                        width: 75,
                        height: 75,
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
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTab(
                        0,
                        "For You",
                      ),
                      _buildTab(
                        1,
                        "Relax",
                      ),
                      _buildTab(
                        2,
                        "Workout",
                      ),
                      _buildTab(
                        3,
                        "Travel",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: TabBarView(
                controller: _tabController,
                children: list,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
    int index,
    String title,
  ) {
    bool isSelected = _tabController.index == index;
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(
          index,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : Colors.transparent,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForYou extends StatefulWidget {
  const ForYou({super.key});

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(
          20,
        ),
        children: [
          body(),
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Featuring Today",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<StorageBloc, StorageState>(
            builder: (context, state) {
              if (state is StorageSucces) {
                return Row(
                  children: state.featuring.images!.map((featuring) {
                    return CardFeatureToday(
                      featuring: FeaturingTodayModels(
                        images: [featuring],
                        name: state.featuring.name,
                      ),
                    );
                  }).toList(),
                );
              } else if (state is StorageFailed) {
                return Text(
                  'Failed to load data: ${state.error}',
                  style: const TextStyle(color: Colors.red),
                );
              }
              return const Center(
                child: Text(
                  "No data available.",
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recently Played",
              style: txtBlack,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "See More",
                style: txtBlack2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<StorageBloc, StorageState>(
            builder: (context, state) {
              if (state is StorageSucces) {
                return Row(
                  children: List.generate(
                    state.recentlyPlayed.name!.length,
                    (index) {
                      return CardRecentlyPlayed(
                        recently: RecentlyPlayedModels(
                          name: [
                            state.recentlyPlayed.name![index],
                          ],
                          image: [
                            state.recentlyPlayed.image![index],
                          ],
                          artist: [
                            state.recentlyPlayed.artist![index],
                          ],
                          deskripsi: [
                            state.recentlyPlayed.deskripsi![index],
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          "Mixes for you",
          style: txtBlack,
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "From Artis You Follow",
              style: txtBlack,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "See More",
                style: txtBlack2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Release",
              style: txtBlack,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "See More",
                style: txtBlack2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Relax extends StatefulWidget {
  const Relax({super.key});

  @override
  State<Relax> createState() => _RelaxState();
}

class _RelaxState extends State<Relax> {
  bool isSelected = false;
  bool play = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        20,
      ),
      children: [
        body(),
      ],
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today Refreshing Song Recommendation",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 15,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                width: 288,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.grey.shade900,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 105,
                          height: 105,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Peace",
                              style: txtWhite.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "22 Songs",
                              style: txtWhite.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                    });
                                  },
                                  child: Icon(
                                    isSelected
                                        ? Icons.favorite_border_outlined
                                        : Icons.favorite,
                                    size: 25,
                                    color:
                                        isSelected ? Colors.grey : Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.more_vert_outlined,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              play = !play;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Icon(
                                play ? Icons.play_arrow : Icons.pause,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CardRelax(
                      name: 'Weigthless',
                      title: 'Marconi Union',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CardRelax(
                      name: 'Nothing It Can',
                      title: 'Helios',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CardRelax(
                      name: 'Small Memory',
                      title: 'Jon Hopkins - Insides',
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 15,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                width: 288,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.grey.shade900,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 105,
                          height: 105,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Peace",
                              style: txtWhite.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "22 Songs",
                              style: txtWhite.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                    });
                                  },
                                  child: Icon(
                                    isSelected
                                        ? Icons.favorite_border_outlined
                                        : Icons.favorite,
                                    size: 25,
                                    color:
                                        isSelected ? Colors.grey : Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.more_vert_outlined,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              play = !play;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Icon(
                                play ? Icons.play_arrow : Icons.pause,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CardRelax(
                      name: 'Weigthless',
                      title: 'Marconi Union',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CardRelax(
                      name: 'Nothing It Can',
                      title: 'Helios',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CardRelax(
                      name: 'Small Memory',
                      title: 'Jon Hopkins - Insides',
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                width: 288,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: Colors.grey.shade900,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 105,
                          height: 105,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Peace",
                              style: txtWhite.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "22 Songs",
                              style: txtWhite.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                    });
                                  },
                                  child: Icon(
                                    isSelected
                                        ? Icons.favorite_border_outlined
                                        : Icons.favorite,
                                    size: 25,
                                    color:
                                        isSelected ? Colors.grey : Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.more_vert_outlined,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              play = !play;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Icon(
                                play ? Icons.play_arrow : Icons.pause,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CardRelax(
                      name: 'Weigthless',
                      title: 'Marconi Union',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CardRelax(
                      name: 'Nothing It Can',
                      title: 'Helios',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CardRelax(
                      name: 'Small Memory',
                      title: 'Jon Hopkins - Insides',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Relaxing",
              style: txtBlack,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "See More",
                style: txtBlack2.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
