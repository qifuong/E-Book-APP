import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyBackButton extends StatelessWidget {
  // Constructor của widget
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Xử lý sự kiện khi nút được nhấn
      onTap: () {
        Get.back(); // Sử dụng GetX để quay trở lại trang trước đó
      },
      child: Row(
        children: [
          // Hiển thị hình ảnh nút back sử dụng thư viện SvgPicture
          SvgPicture.asset("Assets/Icons/back.svg"),
          const SizedBox(
            width: 10,
          ),
          // Hiển thị văn bản "Back"
          Text(
            "Back",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.background),
          ),
        ],
      ),
    );
  }
}
