import 'package:e_book/Config/Colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btnName;  // Tên hiển thị trên nút
  final VoidCallback ontap;  // Hàm callback khi nút được nhấp

  const PrimaryButton({Key? key, required this.btnName, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,  // Màu nền của nút
          borderRadius: BorderRadius.circular(10),  // Góc bo của nút
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hình ảnh (Google logo) trên nút
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: backgroudColor,  // Màu nền hình ảnh
                borderRadius: BorderRadius.circular(10),  // Góc bo của hình ảnh
              ),
              child: Image.asset("Assets/Icons/google.png"),
            ),
            const SizedBox(width: 10),  // Khoảng cách giữa hình ảnh và văn bản

            // Văn bản trên nút
            Text(
              btnName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.background,  // Màu văn bản
                letterSpacing: 1.5,  // Khoảng cách giữa các ký tự
              ),
            ),
          ],
        ),
      ),
    );
  }
}
