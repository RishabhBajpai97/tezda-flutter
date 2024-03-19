import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda/screens/favorites/favorites.dart';
import 'package:tezda/screens/home/home.dart';
import 'package:tezda/screens/profile/profile.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
  }

  final screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const ProfileScreen()
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selected],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey.shade100,
        height: 80.h,
        elevation: 0,
        selectedIndex: selected,
        indicatorColor: const Color(0xff667eea).withOpacity(0.3),
        onDestinationSelected: (value) => {
          setState(() {
            selected = value;
          })
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.star), label: "Favorites"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
