import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns at least two movies with different ids', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, greaterThanOrEqualTo(2));
      expect(movies[0].id, isNot(movies[1].id));
    });

    test('getMovies contains valid Se7en and Inception entries', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie seven = movies[0];
      expect(seven.id, 'seven');
      expect(seven.title, 'Se7en');
      expect(seven.price, 9.50);
      expect(seven.posterImagePath, isNotEmpty);

      final Movie inception = movies[1];
      expect(inception.id, 'inception');
      expect(inception.title, 'Inception');
      expect(inception.price, 10.00);
      expect(inception.posterImagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('seven');

      expect(movie, isNotNull);
      expect(movie?.title, 'Se7en');
      expect(movie?.price, 9.50);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}