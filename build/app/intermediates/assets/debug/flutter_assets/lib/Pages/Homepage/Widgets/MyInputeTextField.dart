import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_book/Pages/Homepage/Widgets/SuggestedBooks.dart';

// Widget này là một trường nhập văn bản với biểu tượng tìm kiếm và khả năng xem danh sách gợi ý sách
class MyInputTextField extends StatelessWidget {
  const MyInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container để bao bọc trường nhập văn bản và biểu tượng tìm kiếm
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              // Biểu tượng tìm kiếm
              InkWell(
                onTap: () {
                  // Khi người dùng chạm vào biểu tượng tìm kiếm, mở trang danh sách gợi ý sách
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedBooks()),
                  );
                },
                child: SvgPicture.asset("Assets/Icons/search.svg"),
              ),
              const SizedBox(width: 10),
              // Trường nhập văn bản mở rộng để người dùng nhập nội dung tìm kiếm
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Ấn Vào Kính Lúp Để Tìm Kiếm . .",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
