import 'package:flutter/material.dart';

class MultiLineTextField extends StatelessWidget {
  final String hintText;  // Chữ mô tả để hiển thị trong ô nhập liệu
  final TextEditingController controller;  // Điều khiển để quản lý giá trị nhập liệu
  const MultiLineTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,  // Số dòng tối đa mà ô nhập liệu này có thể hiển thị
      controller: controller,  // Sử dụng đối tượng điều khiển được cung cấp
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        // Màu nền của ô nhập liệu
        filled: true,  // Đặt true để có nền được tô màu
        hintText: hintText,  // Chữ mô tả để hiển thị khi ô nhập liệu trống
      ),
    );
  }
}
