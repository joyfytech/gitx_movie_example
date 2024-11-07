import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_movie_example/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/movie_controller.dart';
import '../model/movie.dart';
import '../utilz/widgets_functions.dart';

class MovieHomePage extends StatelessWidget {
   MovieHomePage({super.key});


   final MovieController movieController = Get.put(MovieController());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: buildTextFun(context,"Movie List Screen",
          fontSize : 20 , fontWeight : FontWeight.w800,color : Colors.blue),),


      body: Obx(() => ListView.builder(
        itemCount: movieController.movies.length,
        itemBuilder: (context, index) {
          final movie = movieController.movies[index];
          return movieCard(
            movie: movie,
            index: index,
            movieController: movieController,
              context : context,
          );
        },
      )),


      floatingActionButton:FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){

            Get.toNamed(AppRouter.MOVIE_ADD);

      }),
    );
  }
}


