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
  factory Movie.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String title = json['title'] as String;
    final String synopsis = json['synopsis'] as String;
    final String ageRating = json['ageRating'] as String;
    final String runtime = json['runtime'] as String;
    final String screeningTime = json['screeningTime'] as String;
    final num priceNumber = json['price'] as num;
    final double price = priceNumber.toDouble();
    final String posterImagePath = json['posterImagePath'] as String;

    return Movie(
      id: id,
      title: title,
      synopsis: synopsis,
      ageRating: ageRating,
      runtime: runtime,
      screeningTime: screeningTime,
      price: price,
      posterImagePath: posterImagePath,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'title': title,
      'synopsis': synopsis,
      'ageRating': ageRating,
      'runtime': runtime,
      'screeningTime': screeningTime,
      'price': price,
      'posterImagePath': posterImagePath,
    };
    return data;
  }

  String get formattedPrice => '£${price.toStringAsFixed(2)}';
}
