import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MovieRepository asset loading', () {
    test('loadMoviesFromAsset reads every film from the JSON file', () async {
      final MovieRepository repository = MovieRepository();

      final List<Movie> movies = await repository.loadMoviesFromAsset();

      expect(movies.length, 2);
      expect(movies[0].id, 'seven');
      expect(movies[0].price, 9.5);
      expect(movies[1].id, 'inception');
      expect(movies[1].runtime, '2h 28m');
      expect(repository.getMovies(), movies);
    });
  });
}
