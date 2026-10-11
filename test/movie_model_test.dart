import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie Model Test', () {
    test('creates Movie instance with given properties', () {
      Movie movie = Movie(
        id: 'testMovie',
        title: 'Test Movie',
        description: 'Very cool, probaably has Tom Holland or Zendaya or Both',
        ticketCost: 5.25,
        ageRating: '18',
        imagePath: 'assets/images/coolFilm.jpeg',
      );
      expect(movie.id, 'testMovie');
      expect(movie.title, 'Test Movie');
      expect(movie.description, 'Very cool, probaably has Tom Holland or Zendaya or Both');
      expect(movie.ticketCost, 5.25);
      expect(movie.ageRating, '18');
      expect(movie.imagePath, 'assets/images/coolFilm.jpeg');


      
      
    });
    test('test formattedPrice', () {
      Movie movie = Movie(
        id: 'testMovie',
        title: 'Test Movie',
        description: 'Very cool, probaably has Tom Holland or Zendaya or Both',
        ticketCost: 5.25,
        ageRating: '18',
        imagePath: 'assets/images/coolFilm.jpeg',
      );
      expect(movie.formattedPrice, "£5.25");
  });
});
}