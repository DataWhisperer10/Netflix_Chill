import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/upcoming_movie_model.dart';
import 'package:netflix/screens/movie_detailed_screen.dart';

class UpcomingMovieCarWidget extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headLineText;
  const UpcomingMovieCarWidget(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headLineText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => MovieDetailedScreen(
                                        movieId: data[index].id))));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                                "$imageUrl${data[index].posterPath}"),
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Container(
              child: const Text("No Data Fetched"),
            );
          }
        });
  }
}
