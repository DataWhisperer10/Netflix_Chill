import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/movie_detail.dart';
import 'package:netflix/models/movie_recommendation_model.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/models/tv_series_model.dart';
import 'package:netflix/models/upcoming_movie_model.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apikey";
late String endPoint;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovieModel() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //debugPrint("Success response: ${response.body}");
      log("Success response: ${response.body}");
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load Upcoming Movies");
  }

  Future<UpcomingMovieModel> getNowPlyaingMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("Success response: ${response.body}");
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load Now Playing Movies");
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = "tv/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("Success response: ${response.body}");
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load Top Rated TV Series");
  }

  Future<SearchModel> getSearchMovie(String searchText) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";
    print("Search Url is $url");
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTIzMjBhMTg2MDEyNGI2NTMyNTUwNWNmZmMxMzhkNSIsInN1YiI6IjY1ZjkwYjNkMDdlMjgxMDE4NmMxNzc1OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EjMbh-eTFChZKOFEl1emOXQobNYF-xJkP0jsSApZCac"
    });
    if (response.statusCode == 200) {
      log("Success response: ${response.body}");
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load Searched Movies");
  }

  Future<MovieRecommendationModel> getPopluarMovies() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";
    print("Search Url is $url");
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("Success response: ${response.body}");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load Popular Movies");
  }

  Future<MovieDetailedModel> getMovieDetail(int movieId) async {
    endPoint = "movie/$movieId";
    final url = "$baseUrl$endPoint$key";
    print("Movie Details Url is $url");
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      log("Movie Details response: ${response.body}");
      return MovieDetailedModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load Movie Details");
  }

  Future<MovieRecommendationModel> getMovieRecommendations(int movieId) async {
    endPoint = "movie/$movieId/recommendations";
    final url = "$baseUrl$endPoint$key";
    print("recommendations Url is $url");
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      log("Success response: ${response.body}");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load more movies like this");
  }
}
