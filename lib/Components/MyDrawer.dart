import 'package:e_book/Components/AboutPage.dart';
import 'package:e_book/Components/FavoriteBooksProvider.dart';
import 'package:e_book/Components/Infor.dart';
import 'package:e_book/Components/PrivacyPolicy.dart';
import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'FavoriteBooksScreen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  void copyEmailToClipboard() {
    const String email = "support@example.com";
    Clipboard.setData(const ClipboardData(text: email));
    Get.snackbar(
      'Sao chép vào clipboard',
      'Đã sao chép địa chỉ email vào bảng nhớ tạm',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Nhân Viên Hỗ Trợ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            accountEmail: GestureDetector(
              onTap: copyEmailToClipboard,
              child: const Row(
                children: [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 6),
                  Text(
                    "support@example.com",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.black,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: const Text(
              "Trang Chủ",
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(Icons.home, color: Colors.blue),
            onTap: () {
              Get.to(const HomePage());
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            title: const Text(
              "Thông Tin Liên Hệ",
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(Icons.phone, color: Colors.blue),
            onTap: () {
              Get.to(Infor());
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            title: const Text(
              "Chính Sách Bảo Mật Và Quyền Riêng Tư",
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(Icons.security, color: Colors.blue),
            onTap: () {
              Get.to(const PrivacyPolicy());
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            title: const Text(
              "Danh Mục Yêu Thích",
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(Icons.speaker, color: Colors.blue),
            onTap: () {
              Get.to(FavoriteBooksScreen(favoriteBooks: FavoriteBooksProvider().favoriteBooks));
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            title: const Text(
              "Khác",
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(Icons.speaker, color: Colors.blue),
            onTap: () {
              Get.to(const AboutPage());
            },
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
