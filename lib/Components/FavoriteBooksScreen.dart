import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Components/FavoriteBooksProvider.dart';
class FavoriteBooksScreen extends StatelessWidget {
  final List<BookModel> favoriteBooks;

  const FavoriteBooksScreen({Key? key, required this.favoriteBooks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Books'),
      ),
      body: favoriteBooks.isEmpty
          ? Center(
        child: Text('No favorite books yet.'),
      )
          : ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          BookModel book = favoriteBooks[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            // Add other details you want to display
          );
        },
      ),
    );
  }
}
