import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class OrderTicketDisplay extends StatelessWidget {
  final Movie movie;
  final double _quantity;

  const OrderTicketDisplay(this._quantity, this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${movie.title} Ticket Cost: $_quantity');
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
  String _confirmationMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        actions: [const BasketButton()],
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
                  Flexible(
                      child: Text(
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
            ]),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: 'Add to Basket',
                onPressed: _addToBasket,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _confirmationMessage,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
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

  void _addToBasket() {
    double _quantity = totalPrice / widget.movie.ticketCost;
    if (_quantity > 0) {
      final CartItem item = CartItem(
        movie: widget.movie,
        quantity: _quantity.toInt(),
      );
      CartRepository.instance.addItem(item);
      setState(() {
        _confirmationMessage =
            'Added $_quantity ${widget.movie.title} to basket';
      });
    } else {
      setState(() {
        _confirmationMessage = 'Please select at least 1 ticket';
      });
    }
  }
}
