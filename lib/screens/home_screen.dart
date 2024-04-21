import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/tv_series_model.dart';
import 'package:netflix/models/upcoming_movie_model.dart';
import 'package:netflix/screens/search_screen.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widget/custom_crousal.dart';
import 'package:netflix/widget/movie_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowPlayingFuture;
  late Future<TvSeriesModel> topRatedSeries;

  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovieModel();
    nowPlayingFuture = apiServices.getNowPlyaingMovies();
    topRatedSeries = apiServices.getTopRatedSeries();
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const SearchScreen())));
            },
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: topRatedSeries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCarouselSlider(data: snapshot.data!);
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 230,
              child: MovieCardWidget(
                future: upcomingFuture,
                headLineText: "Upcoming Movies",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 230,
              child: MovieCardWidget(
                future: nowPlayingFuture,
                headLineText: "Now Playing Movies",
              ),
            )
          ],
        ),
      ),
    );
  }
}
