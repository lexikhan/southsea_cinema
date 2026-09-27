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
    return Text('$movieName Ticket Cost: $quantity');
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
  int totalPrice = 0;

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
                  Text(
                      "Spongebob Movie (2004)\n Age Rated: U \n SpongeBob takes leave from Bikini Bottom in order to track down, \n with Patrick, King Neptune's stolen crown.")
                ],
              ),
            ),
            OrderTicketDisplay(totalPrice, 'Spongebob Movie'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu<int>(
                  initialSelection: 10,
                  onSelected: (int? value) {
                    if (value != null) {
                      setState(() {
                        totalPrice = value;
                      });
                    }
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: '0 Tickets'),
                    DropdownMenuEntry(value: 3, label: '1 Ticket'),
                    DropdownMenuEntry(value: 6, label: '2 Tickets'),
                    DropdownMenuEntry(value: 9, label: '3 Tickets'),
                    DropdownMenuEntry(value: 10, label: 'Family Ticket'),
                  ],
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
    setState(() => totalPrice = 0);
  }

}
