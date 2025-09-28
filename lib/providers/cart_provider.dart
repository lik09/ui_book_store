import 'package:flutter/foundation.dart';
import '../models/book.dart';

class CartProvider with ChangeNotifier {
  // Map of Book -> quantity
  final Map<Book, int> _items = {};

  Map<Book, int> get items => {..._items};

  void addToCart(Book book, int count) {
    if (_items.containsKey(book)) {
      _items[book] = _items[book]! + count;
    } else {
      _items[book] = count;
    }
    notifyListeners();
  }

  void updateCount(Book book, int count) {
    if (_items.containsKey(book)) {
      if (count <= 0) {
        _items.remove(book);
      } else {
        _items[book] = count;
      }
      notifyListeners();
    }
  }

  void removeFromCart(Book book) {
    if (_items.containsKey(book)) {
      _items.remove(book);
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
