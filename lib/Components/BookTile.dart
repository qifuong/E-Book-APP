import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookTile extends StatelessWidget {
  // Tiêu đề của sách
  final String title;

  // Đường link của ảnh bìa sách
  final String coverUrl;

  // Tác giả của sách
  final String author;

  // Giá sách
  final int price;

  // Đánh giá sách
  final String rating;

  // Tổng số lượt đánh giá
  final int totalRating;

  // Hàm callback khi người dùng nhấn vào thẻ sách
  final VoidCallback ontap;

  // Số lượng đánh giá của sách
  final String numberofRating;

  // Constructor của widget
  const BookTile({
    super.key,
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.price,
    required this.rating,
    required this.totalRating,
    required this.ontap,
    required this.numberofRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: ontap, // Gọi hàm callback khi người dùng nhấn vào thẻ sách
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // Tạo nền cho thẻ sách với màu sắc của chủ đề và độ trong suốt
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                // Hiển thị ảnh bìa sách với hiệu ứng đổ bóng
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(-2, -2),
                  ),
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    coverUrl,
                    width: 100,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hiển thị tiêu đề sách
                    Text(
                      title,
                      maxLines: 10,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    // Hiển thị tác giả sách
                    Text(
                      "By: $author",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    // Hiển thị giá sách với màu của chủ đề
                    Text(
                      "Mã Giảm Giá: $price",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                    ),
                    // Hiển thị đánh giá sách và tổng số lượt đánh giá
                    Row(
                      children: [
                        SvgPicture.asset("Assets/Icons/star.svg"),
                        Text(rating, style: Theme.of(context).textTheme.bodyMedium),
                        Text("($totalRating Rating)",
                            style: Theme.of(context).textTheme.labelMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
