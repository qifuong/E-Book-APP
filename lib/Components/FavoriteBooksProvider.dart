import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_book/Models/BookModel.dart';

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
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> booksJson = _favoriteBooks.map((book) => jsonEncode(book.toJson())).toList();
      prefs.setStringList('favoriteBooks', booksJson);
    } catch (error) {
      print('Error saving favorite books: $error');
    }
  }

  Future<void> _loadFavoriteBooks() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? booksJson = prefs.getStringList('favoriteBooks');
      if (booksJson != null) {
        _favoriteBooks = booksJson.map((json) => BookModel.fromJson(jsonDecode(json))).toList();
        notifyListeners();
      }
    } catch (error) {
      print('Error loading favorite books: $error');
    }
  }

  void toggleFavoriteBook(String title, String coverUrl, String author, int price, String rating, int totalRating, DateTime dateTime) {
    bool isFavorite = isBookFavorite(title);

    if (isFavorite) {
      _favoriteBooks.removeWhere((book) => book.title == title);
    } else {
      _favoriteBooks.add(BookModel(
        title: title,
        coverUrl: coverUrl,
        author: author,
        price: price,
        rating: rating,
        totalRating: totalRating,
        dateTime: dateTime,
      ));
    }

    _saveFavoriteBooks();
    notifyListeners();
  }

  bool isBookFavorite(String title) {
    return _favoriteBooks.any((book) => book.title == title);
  }

  Future<void> loadFavoriteBooks() async {
    await _loadFavoriteBooks();
  }
}
