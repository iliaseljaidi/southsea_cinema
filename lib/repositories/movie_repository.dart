import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }

    return [
      const Movie(
        id: 'seven',
        title: 'Se7en',
        synopsis:
            'A 1995 dark psychological thriller directed by David Fincher that follows two detectives hunting a meticulous serial killer who bases his gruesome murders on the seven deadly sins',
        ageRating: '18',
        screeningTime: 'Friday 8:00 PM',
        runtime: '2h 7m',
        price: 9.50,
        posterImagePath: 'images/seven.jpeg',
      ),
      const Movie(
        id: 'inception',
        title: 'Inception',
        synopsis:
            'A thief who steals secrets from people\'s dreams is given the task of planting an idea in someone\'s mind.',
        ageRating: '12A',
        runtime: '2h 28m',
        screeningTime: 'Saturday 6:30 PM',
        price: 10.00,
        posterImagePath: 'images/inception.jpeg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final Movie movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
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
}
