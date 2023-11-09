import 'package:e_book/Pages/BookPage/BookPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Config/Colors.dart';

class BookActionBtn extends StatelessWidget {
  final String bookUrl;

  const BookActionBtn({Key? key, required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookPage(bookUrl: bookUrl));
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("Assets/Icons/book.svg"),
              const SizedBox(width: 10),
              Text(
                "Read Book",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
