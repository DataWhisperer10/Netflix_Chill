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
              title: const Text("New & Hot"),
            ),
          )),
    );
  }
}
