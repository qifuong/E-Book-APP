import 'package:e_book/Components/BackButton.dart';
import 'package:e_book/Config/Colors.dart';
import 'package:e_book/Models/BookModel.dart';
import 'package:e_book/Pages/BookDetails/BookActionBtn.dart';
import 'package:e_book/Pages/BookDetails/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;
  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              //height: 500,
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
                      langugae: book.language.toString(),
                      audioLen: book.audioLen!,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("About Book",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                            "Đồ án này thực hiện bởi Huynh Thien Bao, Le Minh Hung Và Le Quy Phuong, Nếu có bất kỳ sai sót trong quá trình thực hiện của đồ án, Mong quý thầy cô thông cảm vào bỏ qua, Cảm ơn mọi người",
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("About Book",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                            "This project was made by Huynh Thien Bao, Le Minh Hung and Le Quy Phuong. If there are any errors during the implementation of the project, I hope you will understand and forgive me. Thank you everyone.",
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  BookActionBtn(
                    bookUrl: book.bookurl!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
