import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
Movie testMovie1 = Movie(
  id: 'film1',
  title: 'Movie Number 1',
  description: 'Classic freshly baked sub.',
  ticketCost: 10.0,
  ageRating: '18',
  imagePath: 'assets/images/footlong.jpeg',
);

Movie testMovie2= Movie(
  id: 'film2',
  title: 'Movie Number 2',
  description: 'Six inch sub.',
  ticketCost: 6.0,
  ageRating: 'PG',
  imagePath: 'assets/images/six_inch.jpeg',
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });
  group('CartRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final CartRepository cart = CartRepository.instance;
      expect(cart.getItems().length, 0);
      expect(cart.getTotalItems(), 0);
      expect(cart.totalItemCount, 0);
      expect(cart.getSubtotal(), 0.0);
      expect(cart.getDeliveryFee(), 0.0);
      expect(cart.getTotalDue(), 0.0);
    });

    test('adds items and calculates subtotal and delivery fee correctly', () {
      final CartRepository cart = CartRepository.instance;
      CartItem item1 = CartItem(
        movie: testMovie1,
        quantity: 2,
      );
      CartItem item2 = CartItem(
        movie: testMovie2,
        quantity: 1,
      );

      cart.addItem(item1);
      cart.addItem(item2);

      expect(cart.getItems().length, 2);
      expect(cart.getTotalItems(), 3);
      expect(cart.totalItemCount, 3);
      expect(cart.getSubtotal(), 26.0);
      expect(cart.getDeliveryFee(), 4);
      expect(cart.getTotalDue(), 27.50);
    });

    test('removes items correctly', () {
      final CartRepository cart = CartRepository.instance;
      CartItem item = CartItem(
        movie: testMovie1,
        quantity: 1,
      );
      cart.addItem(item);
      expect(cart.getItems().length, 1);

      cart.removeItem(0);
      expect(cart.getItems().length, 0);
      expect(cart.getTotalDue(), 0.0);
    });
  });
}