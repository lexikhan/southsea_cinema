class Movie {
  final String id;
  final String title;
  final String description;
  final String ageRating;
  final String imagePath;
  final double ticketCost;
  Movie(
      {required this.id,
      required this.title,
      required this.description,
      required this.ageRating,
      required this.imagePath,
      required this.ticketCost});

  String get formattedPrice {
    final String formattedValue = ticketCost.toStringAsFixed(2);
    return '£$formattedValue';
  }

  bool get isChildFriendly {
    if (ageRating == 'U' || ageRating == 'PG' || ageRating == '12A') {
      return true;
    }
    return false;
  }

  bool get isAdultOnly {
    return !isChildFriendly;
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String title = json['title'] as String;
    final String description = json['description'] as String;
    final num price = json['ticketCost'] as num;
    final double ticketCost = price.toDouble();
    final String imagePath = json['imagePath'] as String;
    final String ageRating = json['ageRating'] as String;
    return Movie(
      id: id,
      title: title,
      description: description,
      ageRating: ageRating,
      ticketCost: ticketCost,
      imagePath: imagePath,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'ageRating': ageRating,
      'ticketCost': ticketCost,
      'imagePath': imagePath,
    };
    return data;
  }
}
