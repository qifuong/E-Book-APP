import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  // Đường dẫn đến ảnh bìa của cuốn sách.
  final String coverUrl;

  // Tiêu đề của cuốn sách.
  final String title;

  // Hàm callback sẽ được gọi khi người dùng nhấn vào widget.
  final VoidCallback ontap;

  // Const nhận các tham số bắt buộc như coverUrl, title và ontap.
  const BookCard({
    Key? key,
    required this.coverUrl,
    required this.title,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      // InkWell cho phép xử lý sự kiện nhấn của người dùng.
      child: InkWell(
        onTap: ontap,
        // SizedBox giới hạn kích thước của widget con.
        child: SizedBox(
          width: 120,
          // Column chứa các thành phần con theo chiều dọc.
          child: Column(
            children: [
              // Container chứa ảnh bìa với hiệu ứng boxShadow.
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(-2, -2),
                  ),
                ]),
                // Sử dụng ClipRRect để làm tròn góc của ảnh bìa.
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    coverUrl,
                    width: 120,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 10,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
