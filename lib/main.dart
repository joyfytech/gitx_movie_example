import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_movie_example/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/movie_controller.dart';

void main() {
  Get.put(MovieController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.aBeeZeeTextTheme(
          Theme.of(context).textTheme,
        ),

      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.HOME,
      getPages: AppRouter.routes,

    );
  }
}


