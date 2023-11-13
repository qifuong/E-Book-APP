import 'package:flutter/material.dart';
import 'package:e_book/Components/BackButton.dart';
import 'package:e_book/Components/BookTile.dart';
import 'package:e_book/Controller/AuthController.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Models/Data.dart';
import 'package:e_book/Pages/AddNewBook/AdminVerificationPage.dart';
import 'package:get/get.dart';
import '../BookDetails/BookDetails.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Khởi tạo các controllers cần thiết
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());

    return Scaffold(
      // Nút hành động nổi để thêm sách mới
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AdminVerificationPage());
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Phần đầu trang với thông tin người dùng
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        // Hàng chứa nút quay lại, tiêu đề và nút đăng xuất
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyBackButton(),
                            Text(
                              "Hồ sơ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                authController.signout();
                              },
                              icon: Icon(
                                Icons.exit_to_app,
                                color: Theme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 60),
                        // Hình ảnh đại diện của người dùng
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context)
                                  .colorScheme
                                  .background,
                            ),
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "${authController.auth.currentUser?.photoURL ?? ''}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Tên và email của người dùng
                        Text(
                          "${authController.auth.currentUser?.displayName ?? ''}",
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
                          "${authController.auth.currentUser?.email ?? ''}",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Phần sách của người dùng
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Sách của bạn",
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                  SizedBox(height: 10),
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
                        totalRating: 12,
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
