import 'package:e_book/Components/BackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookDetailsHeader extends StatelessWidget {
  final String coverUrl;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String langugae;
  final String audioLen;

  const BookDetailsHeader({
    super.key,
    required this.coverUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.pages,
    required this.langugae,
    required this.audioLen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyBackButton(),
            SvgPicture.asset("Assets/Icons/heart.svg",
                color: Theme.of(context).colorScheme.background),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                coverUrl,
                width: 160,
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        Text(
          "Author : Yisu",
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        SizedBox(height: 10),
        Text(
          description,
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
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  rating,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Pages",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  pages,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Language",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  langugae,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Audio",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  audioLen,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
