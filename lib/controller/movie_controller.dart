import 'package:get/get.dart';

import '../model/movie.dart';

class MovieController extends GetxController
{
  var movies = <Movie>[].obs;

  void addMovie(Movie movie)
  {
    movies.add(movie);
    Get.snackbar("Movie", "Movie Added Successfully");
  }

  void deleteMovie(String id) {
    movies.removeWhere((movie) => movie.movieId == id);
    Get.snackbar("Movie", "Movie Deleted Successfully");
  }
}