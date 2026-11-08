import 'package:southsea_cinema/models/movie.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;
  
  List<Movie> getMovies(){
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }
    return [
      Movie(id: 'spongebob',
      title: 'The Spongebob Movie',
      description: 'SpongeBob takes leave from Bikini Bottom in order to track down, with Patrick, King Neptunes stolen crown.',
      ageRating: 'U',
      imagePath: 'assets/images/SBSPMoviePoster.jpg',
      ticketCost: 2.5),
      Movie(id: 'minecraft',
      title: 'A Minecraft Movie',
      description: 'Four misfits are suddenly pulled through a mysterious portal into a bizarre cubic wonderland that thrives on imagination. To get back home theyll have to master this world while embarking on a quest with an unexpected expert crafter.',
      ageRating: 'PG',
      imagePath: 'assets/images/MCMoviePoster.jpg',
      ticketCost: 4.25),
    ];
  }
  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];
    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
    Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
  List<Movie> getMoviesByAgeRating(String agerate){
    List<Movie> list = [];
    for (final movie in getMovies()) {
      if (movie.ageRating == agerate) {
        list.add(movie);
      }
    }
    return list;
  }
}
