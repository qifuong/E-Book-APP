import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookModel {
  final String title;
  final String coverUrl;
  final String author;
  final int price;
  final String rating;
  final int totalRating;
  final DateTime dateTime;

  BookModel({
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.price,
    required this.rating,
    required this.totalRating,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'coverUrl': coverUrl,
      'author': author,
      'price': price,
      'rating': rating,
      'totalRating': totalRating,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      coverUrl: json['coverUrl'],
      author: json['author'],
      price: json['price'],
      rating: json['rating'],
      totalRating: json['totalRating'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}

class FavoriteBooksProvider extends ChangeNotifier {
  List<BookModel> _favoriteBooks = [];

  List<BookModel> get favoriteBooks => _favoriteBooks;

  Future<void> _saveFavoriteBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> booksJson = _favoriteBooks.map((book) => jsonEncode(book.toJson())).toList();
    prefs.setStringList('favoriteBooks', booksJson);
    print('Favorite books saved: $booksJson');
  }

  Future<void> _loadFavoriteBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? booksJson = prefs.getStringList('favoriteBooks');
    if (booksJson != null) {
      _favoriteBooks = booksJson.map((json) => BookModel.fromJson(jsonDecode(json))).toList();
      print('Favorite books loaded: $booksJson');
      notifyListeners();
    }
  }

  void toggleFavoriteBook(BookModel book) {
    bool isFavorite = isBookFavorite(book.title);

    if (isFavorite) {
      _favoriteBooks.removeWhere((b) => b.title == book.title);
    } else {
      _favoriteBooks.add(book);
    }

    _saveFavoriteBooks();
    notifyListeners();
  }

  bool isBookFavorite(String title) {
    return _favoriteBooks.any((book) => book.title == title);
  }

  void loadFavoriteBooks() {
    _loadFavoriteBooks();
  }
}
