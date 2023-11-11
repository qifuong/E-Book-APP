import 'package:flutter/material.dart';
import 'package:e_book/Models/BookModel.dart';
import '../../Config/Colors.dart';
import 'BookActionBtn.dart';
import 'HeaderWidget.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;

  // Constructor nhận một đối tượng BookModel để hiển thị thông tin chi tiết
  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold chứa toàn bộ cấu trúc UI
      body: SingleChildScrollView(
        // SingleChildScrollView cho phép cuộn nếu nội dung vượt quá màn hình
        child: Column(
          children: [
            // Phần header chứa thông tin chung về sách
            Container(
              padding: const EdgeInsets.all(20),
              color: primaryColor,  // Đảm bảo 'primaryColor' đã được định nghĩa hoặc sử dụng giá trị màu cụ thể
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
            // Phần mô tả và nút đọc sách
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề của phần mô tả
                  SectionTitle("About Book"),
                  const SizedBox(height: 8),
                  // Mô tả sách
                  DescriptionText(
                    "Đồ án này thực hiện bởi Huỳnh Thiện Bảo, Lê Minh Hưng và Lê Quý Phương. Nếu có bất kỳ sai sót trong quá trình thực hiện của đồ án, mong quý thầy cô thông cảm và bỏ qua. Cảm ơn mọi người.",
                  ),
                  // Tiêu đề của phần mô tả tiếng Anh
                  SectionTitle("About Book (English)"),
                  const SizedBox(height: 8),
                  // Mô tả tiếng Anh của sách
                  DescriptionText(
                    "This project was made by Huỳnh Thiện Bảo, Lê Minh Hưng, and Lê Quý Phương. If there are any errors during the implementation of the project, I hope you will understand and forgive me. Thank you, everyone.",
                  ),
                  const SizedBox(height: 30),
                  // Nút đọc sách
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

// Widget cho tiêu đề của một phần
class SectionTitle extends StatelessWidget {
  final String title;

  // Constructor nhận tiêu đề
  const SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Hiển thị tiêu đề với kiểu chữ được định nghĩa trong Theme
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

// Widget cho phần mô tả với kiểu chữ và thuộc tính khác được định nghĩa trong Theme
class DescriptionText extends StatelessWidget {
  final String text;

  // Constructor nhận nội dung mô tả
  const DescriptionText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.fade, // hoặc TextOverflow.ellipsis
          ),
        ),
      ],
    );
  }
}
