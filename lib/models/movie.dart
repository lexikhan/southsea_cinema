class Movie{
  final String id;
  final String title;
  final String description;
  final String ageRating;
  final String imagePath;
  final double ticketCost;
  Movie({required this.id, 
  required this.title, 
  required this.description, 
  required this.ageRating, 
  required this.imagePath,
  required this.ticketCost});

  String get formattedPrice {
  final String formattedValue = ticketCost.toStringAsFixed(2);
  return '£$formattedValue';}

  bool get isChildFriendly{
    if(ageRating == 'U'||ageRating == 'PG'||ageRating == '12A'){
      return true;
    }
    return false;
  }
  bool get isAdultOnly{
    return !isChildFriendly;
  }
}
