import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_movie_example/controller/movie_controller.dart';
import 'package:getx_movie_example/model/movie.dart';
import 'package:uuid/uuid.dart';

import '../utilz/widgets_functions.dart';
import 'movie_home_page.dart';

class MovieAddPage extends StatelessWidget {
   MovieAddPage({super.key});

   final MovieController movieController = Get.find();

  final _formKey = GlobalKey<FormState>();

   // Define controllers for each field
   final _movieNameController = TextEditingController();
   final _movieDirectorController = TextEditingController();
   final _movieHeroController = TextEditingController();
   final _movieBudgetController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: buildTextFun(context,"Movie Add Screen",
            fontSize : 20 , fontWeight : FontWeight.w800,color : Colors.blue),),
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 300,vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

              buildTextFormField(
                controller: _movieNameController,
                labelText: "Movie Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Movie Name';
                  }
                  return null;
                },
              ),
              buildSizedBoxHeightFun(context,height : 10),
              buildTextFormField(
                controller: _movieDirectorController,
                labelText: "Director Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Director Name';
                  }
                  return null;
                },
              ),
              buildSizedBoxHeightFun(context,height : 10),
              buildTextFormField(
                controller: _movieHeroController,
                labelText: "Hero Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Hero Name';
                  }
                  return null;
                },
              ),
              buildSizedBoxHeightFun(context,height : 10),
              buildTextFormField(
                controller: _movieBudgetController,
                labelText: "Budget",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Budget';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              buildSizedBoxHeightFun(context,height : 10),

              ElevatedButton(

                  onPressed: (){

                    if(_formKey.currentState!.validate())
                      {
                        var uuid = Uuid();
                        String movieId = uuid.v4();

                        final movieName = _movieNameController.text;
                        final movieDirecterName = _movieDirectorController.text;
                        final movieHeroName = _movieHeroController.text;
                        final movieBudget = double.parse(_movieBudgetController.text);

                        final movie = Movie(movieId: movieId,movieName: movieName,
                            movieDirName: movieDirecterName,
                            movieHeroName: movieHeroName,movieBudget: movieBudget);

                        print("Movie Details : ${movie}");

                        movieController.addMovie(movie);


                        Navigator.pop(context);

                      }
                  },
                  child: buildTextFun(context, "Submit", fontSize: 20,
                      fontWeight: FontWeight.bold, color: Colors.blue)),

              // buildElevatedButtonFun(
              //   context,
              // )


                    ],
                  ),
          ),

      ),
    );

  }
}


