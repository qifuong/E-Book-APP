import 'package:e_book/Components/AboutPage.dart';
import 'package:e_book/Components/Infor.dart';
import 'package:e_book/Components/PrivacyPolicy.dart';
import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import services.dart for clipboard access
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  // Function to copy the email to the clipboard
  void copyEmailToClipboard() {
    final String email = "support@example.com";
    Clipboard.setData(ClipboardData(text: email));
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
            accountName: Text(
              "Nhân Viên Hỗ Trợ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            accountEmail: GestureDetector(
              onTap: copyEmailToClipboard,
              child: Row(
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
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.black,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              "Trang Chủ",
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(Icons.home, color: Colors.blue),
            onTap: () {
              Get.to(HomePage());
            },
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text(
              "Thông Tin Liên Hệ",
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(Icons.phone, color: Colors.blue),
            onTap: () {
              Get.to(Infor());
            },
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text(
              "Chính Sách Bảo Mật Và Quyền Riêng Tư",
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(Icons.security, color: Colors.blue),
            onTap: () {
              Get.to(PrivacyPolicy());
            },
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text(
              "Khác",
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(Icons.speaker, color: Colors.blue),
            onTap: () {
              Get.to(AboutPage());
            },
          ),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}
