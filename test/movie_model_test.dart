import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test-film',
        title: 'Test Film',
        synopsis: 'A film used for testing.',
        ageRating: '15',
        runtime: '1h 45m',
        screeningTime: 'Sunday 4:00 PM',
        price: 8.75,
        posterImagePath: 'images/test.jpeg',
      );

      expect(movie.id, 'test-film');
      expect(movie.title, 'Test Film');
      expect(movie.synopsis, 'A film used for testing.');
      expect(movie.ageRating, '15');
      expect(movie.runtime, '1h 45m');
      expect(movie.screeningTime, 'Sunday 4:00 PM');
      expect(movie.price, 8.75);
      expect(movie.posterImagePath, 'images/test.jpeg');
    });

    test('formattedPrice shows two decimal places for a price with pence', () {
      const movie = Movie(
        id: 'pence',
        title: 'Pence Film',
        synopsis: 'Synopsis',
        ageRating: '12A',
        runtime: '2h 0m',
        screeningTime: 'Monday 7:00 PM',
        price: 9.5,
        posterImagePath: 'images/test.jpeg',
      );

      expect(movie.formattedPrice, '£9.50');
    });

    test('formattedPrice shows two decimal places for a whole-pound price', () {
      const movie = Movie(
        id: 'pound',
        title: 'Pound Film',
        synopsis: 'Synopsis',
        ageRating: 'PG',
        runtime: '1h 30m',
        screeningTime: 'Tuesday 5:00 PM',
        price: 10,
        posterImagePath: 'images/test.jpeg',
      );

      expect(movie.formattedPrice, '£10.00');
    });
  });
}