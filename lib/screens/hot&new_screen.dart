import 'package:flutter/material.dart';

class HotNewScreen extends StatefulWidget {
  const HotNewScreen({super.key});

  @override
  State<HotNewScreen> createState() => _HotNewScreenState();
}

class _HotNewScreenState extends State<HotNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: const Text(
                "New & Hot",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Container(
                    height: 27,
                    width: 27,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
              bottom: TabBar(
                  dividerColor: Colors.black,
                  isScrollable: false,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      text: "  Comming Soon  ",
                    ),
                    Tab(
                      text: "  Everyone is Watching  ",
                    )
                  ]),
            ),
          )),
    );
  }
}
