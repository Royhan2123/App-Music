import 'package:application_music/style/stylesheet.dart';
import 'package:flutter/material.dart';
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
                          Text(
                            "Hi, Royhan",
                            style: txtBlack3,
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
                              "https://avatars.githubusercontent.com/u/121564375?v=4",
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                            ),
                          ],
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
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 280,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                width: 280,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
              ),
              Container(
                width: 280,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
              ),
            ],
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

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Relax extends StatefulWidget {
  const Relax({super.key});

  @override
  State<Relax> createState() => _RelaxState();
}

class _RelaxState extends State<Relax> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
