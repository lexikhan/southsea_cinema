import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Southsea Cinema App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderTicketDisplay extends StatelessWidget {
  final String movieName;
  final int quantity;

  const OrderTicketDisplay(this.quantity, this.movieName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $movieName tickets: ${'🎫' * quantity}');
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;

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
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Spongebob Movie (2004)\n Age Rated: U \n SpongeBob takes leave from Bikini Bottom in order to track down, \n with Patrick, King Neptune's stolen crown.")
                ],
              ),
            ),
            OrderTicketDisplay(_quantity, 'Spongebob Movie'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increaseQuantity,
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: _decreaseQuantity,
                  child: const Text('Remove'),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: _setQuantity,
                child: const Text('Buy'),
              )
            ])
          ],
        ),
      ),
    );
  }

  void _setQuantity() {
    setState(() => _quantity = 0);
  }

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }
}
