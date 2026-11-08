import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/screens/basket_screen.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/widgets/settings_button.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieRepository repository = MovieRepository();
    final List<Movie> movies = repository.getMovies();

    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: TextStyle(color: Colors.white)),
          actions: [SettingsButton(), BasketButton()],
        ),
        drawer: NavDrawer(),
        body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: ((context, index) {
            return MovieCard(movie: movies[index]);
          }),)
        
        );
        
  }
}
