import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies(){
    return [
      Movie(id: 'spongebob',
      title: 'The Spongebob Movie',
      description: 'SpongeBob takes leave from Bikini Bottom in order to track down, with Patrick, King Neptunes stolen crown.',
      ageRating: 'U',
      imagePath: 'assets/images/SBSPMoviePoster'),
      Movie(id: 'minecraft',
      title: 'A Minecraft Movie',
      description: 'Four misfits are suddenly pulled through a mysterious portal into a bizarre cubic wonderland that thrives on imagination. To get back home theyll have to master this world while embarking on a quest with an unexpected expert crafter.',
      ageRating: 'PG',
      imagePath: 'assets/images/MCMoviePoster.jpg'),
    ];
  }
}
