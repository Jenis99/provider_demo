import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_demo/module/movie/controller/movie_controller.dart';
import 'package:provider_demo/util/app_string.dart';
import 'package:provider_demo/util/app_text.dart';
import 'package:provider_demo/util/color_resources.dart';
import 'package:provider_demo/util/custom_widget/custom_network_image.dart';
import 'package:provider_demo/util/utils.dart';

class MovieScreen extends StatelessWidget {
  final MovieController _movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 380.0,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomNetworkImage(
                image: Utils.getFullUrl(
                  endPoint: _movieController.movieDetail.value.posterPath,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: _movieController.movieDetail.value.originalTitle.toString(),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: AppText(text: "Vote : ${_movieController.movieDetail.value.voteCount.toString()}"),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: AppText(text: AppString.storyLine, fontSize: 20.0, fontWeight: FontWeight.bold)),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: AppText(
                        text: _movieController.movieDetail.value.overview.toString(),
                        fontSize: 18,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
