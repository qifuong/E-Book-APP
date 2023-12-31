import 'package:e_book/Components/BookCard.dart';
import 'package:e_book/Components/BookTile.dart';
import 'package:e_book/Components/MyDrawer.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Models/Data.dart';
import 'package:e_book/Pages/BookDetails/BookDetails.dart';
import 'package:e_book/Pages/Homepage/Widgets/AppBar.dart';
import 'package:e_book/Pages/Homepage/Widgets/CategoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Widgets/MyInputeTextField.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller để quản lý sách
    BookController bookController = Get.put(BookController());
    // Lấy danh sách sách của người dùng
    bookController.getUserBook();

    return Scaffold(
      // Thanh trượt bên trái của ứng dụng
      drawer: const MyDrawer(),

      // Nội dung chính của trang
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Phần đầu trang với các thông tin chính và thanh tìm kiếm
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              color: Theme.of(context).colorScheme.primary,
              height: 450,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          // Thanh AppBar tùy chỉnh
                          const HomeAppBar(),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              Text(
                                "Good Morining✌️",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                ),
                              ),
                              Text(
                                "Thầy Võ Anh Tiến",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Thời gian để đọc sách và nâng cao kiến thức của bạn",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Ô tìm kiếm sách
                          const MyInputTextField(),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Topics",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Danh sách chủ đề
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoryData
                                  .map(
                                    (e) => CategoryWidget(
                                  iconPath: e["icon"]!,
                                  btnName: e["lebel"]!,
                                  url: e["url"],
                                ),
                              )
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Phần danh sách sách xu hướng và sở thích của người dùng
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Danh sách sách xu hướng
                  Row(
                    children: [
                      Text(
                        "Xu hướng",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: bookData
                          .map(
                            (e) => BookCard(
                          title: e.title!,
                          coverUrl: e.coverUrl!,
                          ontap: () {
                            Get.to(BookDetails(
                              book: e,
                            ));
                          },
                        ),
                      )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Danh sách sách sở thích của người dùng
                  Row(
                    children: [
                      Text(
                        "Sở thích của bạn",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: bookData
                        .map(
                          (e) => BookTile(
                        title: e.title!,
                        coverUrl: e.coverUrl!,
                        author: e.author!,
                        price: e.price!,
                        rating: e.rating!,
                        numberofRating: e.numberofRating!,
                        totalRating: 10,
                        ontap: () {
                          Get.to(BookDetails(
                            book: e,
                          ));
                        },
                      ),
                    )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
