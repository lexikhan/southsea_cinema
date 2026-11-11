import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/screens/settings_screen.dart';
import 'package:southsea_cinema/screens/ticket_screen.dart';
import 'package:southsea_cinema/screens/basket_screen.dart';

void main() {
  runApp(const SouthseaCinemaApp());
}

class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: cinemaBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cinemaBrand,
          primary: cinemaBrand,
          surface: cinemaSurface,
        ),
        
      ),
      
      initialRoute: '/',
        routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return const TicketScreen();
        },
        '/basket': (BuildContext context) {
          return const BasketScreen();
        },
        '/settings': (BuildContext context) {
          return const SettingsScreen();
        },
      },
    );
  }
  
}


