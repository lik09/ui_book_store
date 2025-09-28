import 'package:book_store/models/book.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Book> _favorites = [];

  List<Book> get favorites => _favorites;

  void toggleFavorite(Book book) {
    if (_favorites.contains(book)) {
      _favorites.remove(book);
    } else {
      _favorites.add(book);
    }
    notifyListeners();
  }

  bool isFavorite(Book book) => _favorites.contains(book);
}
