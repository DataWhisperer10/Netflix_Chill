import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/movie_detail.dart';
import 'package:netflix/services/api_services.dart';

class MovieDetailedScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailedScreen({super.key, required this.movieId});

  @override
  State<MovieDetailedScreen> createState() => _MovieDetailedScreenState();
}

class _MovieDetailedScreenState extends State<MovieDetailedScreen> {
  ApiServices apiServices = ApiServices();
  late Future<MovieDetailedModel> movieDetail;
  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  fetchInitialData() {
    movieDetail = apiServices.getMovieDetail(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data;

              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "$imageUrl${movie!.backdropPath}"))),
                      )
                    ],
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
