class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String runtime;
  final String screeningTime;
  final double price;
  final String posterImagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.runtime,
    required this.screeningTime,
    required this.price,
    required this.posterImagePath,
  });

  String get formattedPrice => '£${price.toStringAsFixed(2)}';
}
