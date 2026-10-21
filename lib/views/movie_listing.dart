import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';

class OrderTicketDisplay extends StatelessWidget {
  final Movie movie;
  final double quantity;

  const OrderTicketDisplay(this.quantity, this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${movie.title} Ticket Cost: $quantity');
  }
}

class OrderScreen extends StatefulWidget {
  final Movie movie;

  const OrderScreen(this.movie, {super.key});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  double totalPrice = 0;
  String buttonText = 'Buy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.movie.imagePath,
                    width: 68,
                    height: 101,
                    fit: BoxFit.cover,
                  ),
                  Flexible(child: Text(
                      "${widget.movie.title}\n Age Rated: ${widget.movie.ageRating} \n ${widget.movie.description}"))
                ],
              ),
            ),
            OrderTicketDisplay(totalPrice, widget.movie),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu<int>(
                  initialSelection: 0,
                  onSelected: (int? value) {
                    if (value != null) {
                      setState(() {
                        totalPrice = value * widget.movie.ticketCost;
                      });
                    }
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: 'No Ticket'),
                    DropdownMenuEntry(value: 1, label: '1 Ticket '),
                    DropdownMenuEntry(value: 2, label: '2 Tickets'),
                    DropdownMenuEntry(value: 3, label: '3 Tickets'),
                    DropdownMenuEntry(value: 4, label: 'Family Ticket'),
                  ],
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: _changeButtonText,
                child: Text(buttonText),
              )
            ])
          ],
        ),
      ),
    );
  }

  void _changeButtonText() {
    setState(() {
      buttonText = 'Bought';
    });
  }
}
