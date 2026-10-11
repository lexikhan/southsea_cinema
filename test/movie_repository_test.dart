import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });
    test('getMovie contains valid Spongebob and Minecraft', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> sandwiches = repository.getMovies();

      final  Movie SBSP = sandwiches[0];
      expect(SBSP.id, 'spongebob');
      expect(SBSP.title, 'The Spongebob Movie');
      expect(SBSP.ticketCost, 2.5);
      expect(SBSP.imagePath, isNotEmpty);

      final Movie MCM = sandwiches[1];
      expect(MCM.id, 'minecraft');
      expect(MCM.title, 'A Minecraft Movie');
      expect(MCM.ticketCost, 4.25);
      expect(MCM.imagePath, isNotEmpty);
    });
        test('getMovieById returns matching Movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('spongebob');

      expect(movie, isNotNull);
      expect(movie?.title, 'The Spongebob Movie');
      expect(movie?.ticketCost, 2.5);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
    test('getMovieByAgeRating returns correct amount of movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movie = repository.getMoviesByAgeRating('U');

      expect(movie.length, 1);
    });
    test('getMovieByAgeRating returns correct amount of movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movie = repository.getMoviesByAgeRating('18');

      expect(movie.length, 0);
    });
  });
}
