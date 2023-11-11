import 'package:e_book/Components/BackButton.dart';
import 'package:e_book/Components/BookTile.dart';
import 'package:e_book/Controller/AuthController.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Models/Data.dart';
import 'package:e_book/Pages/AddNewBook/AdminVerificationPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../BookDetails/BookDetails.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller cho xác thực và sách
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());

    return Scaffold(
      // Nút thêm sách mới
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AdminVerificationPage());
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      // Nội dung chính của trang
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Phần đầu trang với thông tin cá nhân
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
                        // Dòng tiêu đề và nút quay lại
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyBackButton(),
                            Text(
                              "Profile",
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
                                ))
                          ],
                        ),
                        SizedBox(height: 60),
                        // Avatar người dùng
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context)
                                    .colorScheme
                                    .background,
                              )),
                          child: Container(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "${authController.auth.currentUser!.photoURL}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Tên và email người dùng
                        Text(
                          "${authController.auth.currentUser!.displayName}",
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
                          "${authController.auth.currentUser!.email}",
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
            // Phần sách đã đăng
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Your Books",
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Danh sách sách đã đăng của người dùng
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
