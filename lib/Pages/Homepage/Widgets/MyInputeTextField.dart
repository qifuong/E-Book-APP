import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_book/Pages/Homepage/Widgets/SuggestedBooks.dart'; // Import danh sách gợi ý sách

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>SuggestedBooks()),
                  );
                },
                child: SvgPicture.asset("Assets/Icons/search.svg"),
              ),
              const SizedBox(width: 10),
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
