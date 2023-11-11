import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Components/FavoriteBooksProvider.dart';

class BookDetailsHeader extends StatefulWidget {
  final String coverUrl;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String language;
  final String audioLen;

  const BookDetailsHeader({
    Key? key,
    required this.coverUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.pages,
    required this.language,
    required this.audioLen,
  }) : super(key: key);

  @override
  _BookDetailsHeaderState createState() => _BookDetailsHeaderState();
}

class _BookDetailsHeaderState extends State<BookDetailsHeader> {
  bool isBookLiked = false;

  @override
  void initState() {
    super.initState();
    // Load liked books from shared preferences
    _loadLikedBooks();
  }

  Future<void> _loadLikedBooks() async {
    try {
      await FavoriteBooksProvider().loadFavoriteBooks();
      setState(() {
        isBookLiked = FavoriteBooksProvider().isBookFavorite(widget.title);
      });
    } catch (error) {
      print('Error loading liked books: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isBookLiked = !isBookLiked;
                  FavoriteBooksProvider().toggleFavoriteBook(
                    widget.title,
                    widget.coverUrl,
                    widget.author,
                    0, // Replace with the actual value for price
                    widget.rating,
                    0, // Replace with the actual value for totalRating
                    DateTime.now(), // Add current date and time
                  );
                });
              },
              child: SvgPicture.asset(
                "Assets/Icons/heart.svg",
                color: isBookLiked
                    ? Colors.red
                    : Theme.of(context).colorScheme.background,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.coverUrl,
                width: 160,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        Text(
          "Author : ${widget.author}",
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        const SizedBox(height: 10),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Rating",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  widget.rating,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Pages",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  widget.pages,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Language",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  widget.language,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Audio",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  widget.audioLen,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
