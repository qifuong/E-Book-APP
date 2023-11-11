import 'package:e_book/Pages/BookPage/BookPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Config/Colors.dart';

// Widget BookActionBtn để tạo nút chức năng cho việc đọc sách
class BookActionBtn extends StatelessWidget {
  // Đường dẫn đến ảnh bìa sách, sẽ được sử dụng khi chuyển đến trang đọc sách
  final String bookUrl;

  // Constructor nhận đường dẫn đến ảnh bìa sách
  const BookActionBtn({Key? key, required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    // GestureDetector cho phép xử lý sự kiện khi người dùng nhấn vào nút
    return GestureDetector(
      onTap: () {
        // Sử dụng Get.to để chuyển đến trang đọc sách với đường dẫn đến ảnh bìa sách
        Get.to(BookPage(bookUrl: bookUrl));
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        // Center chứa nội dung của nút
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sử dụng SvgPicture.asset để hiển thị biểu tượng sách từ tệp SVG
              SvgPicture.asset("Assets/Icons/book.svg"),
              const SizedBox(width: 10),
              // Text mô tả chức năng của nút
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
