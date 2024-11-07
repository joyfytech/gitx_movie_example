import 'package:get/get.dart';
import 'package:getx_movie_example/pages/movie_add_page.dart';
import 'package:getx_movie_example/pages/movie_home_page.dart';
import 'package:getx_movie_example/pages/movie_update.dart';

class AppRouter{
  static const HOME = "/home";
  static const MOVIE_ADD = "/movie-add";
  static const MOVIE_UPDATE = "/movie-update";

  static final routes = [
    GetPage(name: HOME, page: ()=>MovieHomePage(),transition: Transition.fade,transitionDuration: Duration(seconds: 3)),
    GetPage(name: MOVIE_ADD, page: ()=> MovieAddPage(),transition: Transition.zoom,transitionDuration: Duration(seconds: 1)),
    GetPage(name: MOVIE_UPDATE, page : ()=> MovieUpdate()),
  ];
}