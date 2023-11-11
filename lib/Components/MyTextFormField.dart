import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;  // Văn bản hiển thị khi ô nhập liệu trống
  final IconData icon;  // Biểu tượng hiển thị trước ô nhập liệu
  final bool isNumber;  // Xác định loại bàn phím (text hoặc number)
  final TextEditingController controller;  // Điều khiển ô nhập liệu

  // Hàm khởi tạo
  const MyTextFormField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isNumber = false,  // Mặc định là ô nhập liệu văn bản
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      // Chọn loại bàn phím
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        // Màu nền của ô nhập liệu
        filled: true,  // Đánh dấu ô nhập liệu là đã được điền
        hintText: hintText,  // Hiển thị gợi ý văn bản khi ô nhập liệu trống
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,  // Màu của biểu tượng trước ô nhập liệu
        ),
      ),
    );
  }
}
