import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
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
    return Text('${movie.title} Ticket Cost: ${_quantity*movie.ticketCost}');
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
  double quantity = 0;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ${widget.movie.title}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OrderTicketDisplay(quantity, widget.movie),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decreaseQuantity,
                  child: const Text('Remove'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _increaseQuantity,
                  child: const Text('Add'),
                ),
              ],
            ),
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
      ));
  }

  void _increaseQuantity() {
    setState(() {
      quantity = quantity + 1;
    });
  }
  void _decreaseQuantity() {
    setState(() {
      quantity = quantity - 1;
    });
  }

  void _addToBasket() {
    
    if (quantity > 0) {
      final CartItem item = CartItem(
        movie: widget.movie,
        quantity: quantity.toInt(),
      );
      CartRepository.instance.addItem(item);
      setState(() {
        _confirmationMessage =
            'Added $quantity ${widget.movie.title} to basket';
      });
    } else {
      setState(() {
        _confirmationMessage = 'Please select at least 1 ticket';
      });
    }
  }
}
