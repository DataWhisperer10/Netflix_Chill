import 'package:flutter/material.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:netflix/screens/more_screen.dart';
import 'package:netflix/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            bottomNavigationBar: Container(
              color: Colors.black,
              height: 80,
              child: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_filled),
                    text: "Home",
                  ),
                  Tab(
                    icon: Icon(Icons.search),
                    text: "Search",
                  ),
                  Tab(
                    icon: Icon(Icons.photo_library_outlined),
                    text: "Hot & New",
                  ),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
              ),
            ),
            body: const TabBarView(
                children: [HomeScreen(), SearchScreen(), MoreScreen()])));
  }
}
