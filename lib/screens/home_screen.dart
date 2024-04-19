import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/upcoming_movie_model.dart';
import 'package:netflix/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovieModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Image.asset(
          "assets/logo.png",
          height: 50,
          width: 130,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Container(
                height: 27,
                width: 27,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
