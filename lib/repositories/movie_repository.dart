import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      const Movie(
        id: 'seven',
        title: 'Se7en',
        synopsis:
            'A 1995 dark psychological thriller directed by David Fincher that follows two detectives hunting a meticulous serial killer who bases his gruesome murders on the seven deadly sins',
        ageRating: '18',
        screeningTime: 'Friday 8:00 PM',
        price: 9.50,
        posterImagePath: 'images/seven.jpeg',
      ),
      const Movie(
        id: 'inception',
        title: 'Inception',
        synopsis:
            'A thief who steals secrets from people\'s dreams is given the task of planting an idea in someone\'s mind.',
        ageRating: '12A',
        screeningTime: 'Saturday 6:30 PM',
        price: 10.00,
        posterImagePath: 'images/inception.jpeg',
      ),
    ];
  }
}