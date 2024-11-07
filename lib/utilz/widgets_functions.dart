import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/movie_controller.dart';
import '../model/movie.dart';
import '../router/app_router.dart';

buildTextFun(BuildContext context, String title, {required double fontSize,
  required FontWeight fontWeight, required MaterialColor color}) {
  return Text(title,style: GoogleFonts.aBeeZee(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color
  ),);
}

// Reusable form field function
TextFormField buildTextFormField({
  required TextEditingController controller,
  required String labelText,
  required String? Function(String?) validator,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
    ),
    validator: validator,
  );
}
buildSizedBoxHeightFun(BuildContext context, {required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget movieCard({
  required Movie movie,
  required int index,
  required MovieController movieController,
  required BuildContext context,
}) {
  return Card(
    child: ListTile(
      title: Text(movie.movieName.toString()),
      subtitle: Text(movie.movieBudget.toString()),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {

          Get.defaultDialog(
            title: 'Delete Movie',
            middleText: 'Are you sure you want to delete this movie?',
            onCancel: () {
              Navigator.pop(context);
            },
            onConfirm: (){
              movieController.deleteMovie(movie.movieId.toString());
              Navigator.pop(context);
          },
          );
        },
      ),
      onTap: () {
        Get.toNamed('/movie-details/${movie.movieBudget}', arguments: movie);
      },
    ),
  );
}