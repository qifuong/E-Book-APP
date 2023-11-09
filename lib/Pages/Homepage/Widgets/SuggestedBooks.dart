import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../../Components/BookCard.dart';
import '../../../Models/BookModel.dart';
import '../../../Models/Data.dart';
import '../../BookDetails/BookDetails.dart';

class SuggestedBooks extends StatefulWidget {
  @override
  _SuggestedBooksState createState() => _SuggestedBooksState();
}

class _SuggestedBooksState extends State<SuggestedBooks> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> viewedBooks = [];
  List<BookModel> allBooks = [];
  List<BookModel> suggestedBooks = [];
  bool showAllBooks = true;

  @override
  void initState() {
    super.initState();
    allBooks.addAll(bookData);
    loadViewedBooks();
  }

  void loadViewedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final viewed = prefs.getStringList('viewedBooks') ?? [];
    setState(() {
      viewedBooks = viewed.map((itemJson) {
        final item = json.decode(itemJson);
        final book = BookModel.fromJson(json.decode(item['book']));
        final time = item['time'];
        return {
          'book': book,
          'time': time,
        };
      }).toList();
    });
  }

  void saveViewedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final viewed = viewedBooks.map((item) {
      final book = item['book'];
      final time = item['time'];
      final bookJson = json.encode(book.toJson());
      return json.encode({
        'book': bookJson,
        'time': time,
      });
    }).toList();
    prefs.setStringList('viewedBooks', viewed);
  }

  void searchBooks(String keyword) {
    setState(() {
      suggestedBooks.clear();
    });

    if (keyword.isEmpty) {
      showAllBooks = true;
      suggestedBooks.addAll(allBooks);
    } else {
      showAllBooks = false;
      for (var book in allBooks) {
        if (book.title!.toLowerCase().contains(keyword.toLowerCase())) {
          setState(() {
            suggestedBooks.add(book);
          });
        }
      }
    }
  }

  void showViewedBooksDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sách đã xem'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: viewedBooks.map((item) {
                final book = item['book'];
                final time = item['time'];
                return ListTile(
                  title: Text('${book.title} - $time'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDetails(book: book),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Đóng'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  viewedBooks = [];
                });
                saveViewedBooks();
                Navigator.pop(context);
              },
              child: Text('Xoá lịch sử'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showAllBooks) {
      suggestedBooks.addAll(allBooks);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tìm kiếm sách',
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextField(
              controller: _searchController,
              onChanged: (text) {
                searchBooks(text);
              },
              onSubmitted: (text) {
                _searchController.clear();
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm sách...',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                fillColor: Colors.white,
              ),
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Hiển thị thành hai cột
              ),
              itemCount: suggestedBooks.length,
              itemBuilder: (context, index) {
                return BookCard(
                  coverUrl: suggestedBooks[index].coverUrl!,
                  title: suggestedBooks[index].title!,
                  ontap: () {
                    addToViewedBooks(suggestedBooks[index]);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDetails(book: suggestedBooks[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showViewedBooksDialog,
        child: Icon(Icons.history),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void addToViewedBooks(BookModel book) {
    setState(() {
      viewedBooks.add({
        'book': book,
        'time': getVietnamTime(),
      });
    });
    saveViewedBooks();
  }
}

String getVietnamTime() {
  final now = DateTime.now();
  final vietnamTime = now.toLocal();
  final formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
  return formatter.format(vietnamTime);
}
