class Movie
{
  String? movieId;
  String? movieName;
  String? movieDirName;
  String? movieHeroName;
  double? movieBudget;

  Movie({required this.movieId, required this.movieName,
    required this.movieDirName, required this.movieHeroName,
    required this.movieBudget});

  @override
  String toString() {
    return 'Movie{movieId: $movieId, movieName: $movieName, movieDirName: $movieDirName, movieHeroName: $movieHeroName, movieBudget: $movieBudget}';
  }
}