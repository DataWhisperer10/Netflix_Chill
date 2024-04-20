import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();
  SearchModel? searchModel;
  void search(String query) {
    apiServices.getSearchMovie(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoSearchTextField(
                padding: const EdgeInsets.all(8),
                controller: searchController,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white60,
                ),
                suffixIcon: const Icon(
                  Icons.cancel,
                  color: Colors.white60,
                ),
                style: TextStyle(
                    color: Colors.white30,
                    backgroundColor: Colors.grey.withOpacity(0.3)),
                onChanged: (value) {
                  if (value.isEmpty) {
                  } else {
                    search(searchController.text);
                  }
                },
              ),
              searchModel == null
                  ? const SizedBox.shrink()
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: searchModel?.results.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.2 / 2),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "$imageUrl${searchModel!.results[index].backdropPath}",
                              height: 170,
                              width: 170,
                            )
                          ],
                        );
                      })
            ],
          ),
        ),
      ),
    );
  }
}
