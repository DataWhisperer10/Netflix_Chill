import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/tv_series_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  final TvSeriesModel data;
  const CustomCarouselSlider({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          var url = data.results[index].backdropPath.toString();
          return GestureDetector(
              child: Column(
            children: [
              CachedNetworkImage(imageUrl: "$imageUrl$url"),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.results[index].name,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ));
        },
        options: CarouselOptions(
          height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
          autoPlay: true,
          reverse: false,
          aspectRatio: 16 / 9,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayCurve: Curves.easeInCubic,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          initialPage: 0,
        ),
      ),
    );
  }
}
