import 'package:e_book/Controller/BookController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          InkWell(
            onTap: () async {
              // Tạo URL của ứng dụng Google với tìm kiếm
              final String googleSearchUrl = 'https://www.google.com/search?q=';

              // Hiển thị ứng dụng Google và tìm kiếm theo từ khoá
              String searchTerm = ''; // Đặt giá trị tìm kiếm từ TextFormField ở đây
              String url = googleSearchUrl + Uri.encodeComponent(searchTerm);

              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Không thể mở ứng dụng Google';
              }
            },
            child: SvgPicture.asset("Assets/Icons/search.svg"),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Search here . .",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
