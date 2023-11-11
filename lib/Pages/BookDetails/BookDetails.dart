import 'package:e_book/Config/Colors.dart';
import 'package:e_book/Models/BookModel.dart';
import 'package:e_book/Pages/BookDetails/BookActionBtn.dart';
import 'package:e_book/Pages/BookDetails/HeaderWidget.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;

  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: primaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: BookDetailsHeader(
                      coverUrl: book.coverUrl!,
                      title: book.title!,
                      author: book.author!,
                      description: book.description!,
                      rating: book.rating!,
                      pages: book.pages.toString(),
                      language: book.language.toString(),
                      audioLen: book.audioLen!,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle("About Book"),
                  const SizedBox(height: 8),
                  DescriptionText(
                    "Đồ án này thực hiện bởi Huỳnh Thiện Bảo, Lê Minh Hưng và Lê Quý Phương. Nếu có bất kỳ sai sót trong quá trình thực hiện của đồ án, mong quý thầy cô thông cảm và bỏ qua. Cảm ơn mọi người.",
                  ),
                  SectionTitle("About Book (English)"),
                  const SizedBox(height: 8),
                  DescriptionText(
                    "This project was made by Huỳnh Thiện Bảo, Lê Minh Hưng, and Lê Quý Phương. If there are any errors during the implementation of the project, I hope you will understand and forgive me. Thank you, everyone.",
                  ),
                  const SizedBox(height: 30),
                  BookActionBtn(bookUrl: book.bookurl!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String text;

  const DescriptionText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.fade, // or TextOverflow.ellipsis
          ),
        ),
      ],
    );
  }
}
