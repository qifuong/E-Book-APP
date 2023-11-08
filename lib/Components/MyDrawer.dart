import 'package:e_book/Components/AboutPage.dart';
import 'package:e_book/Components/Infor.dart';
import 'package:e_book/Components/PrivacyPolicy.dart';
import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Nhân Viên Hỗ Trợ"),
            accountEmail: Row(
              children: [
                Icon(Icons.email, color: Colors.white), // Email icon
                SizedBox(width: 6), // Spacing between icon and text
                Text("support@example.com"),
              ],
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue, // Set the background color
            ),
          ),
          ListTile(
            title: Text("Trang Chủ"),
            leading: Icon(Icons.home),
            onTap: () {
              Get.to(HomePage());
            },
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text("Thông Tin Liên Hệ"),
            leading: Icon(Icons.phone),
            onTap: () {
              Get.to(Infor());
            },
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text("Chính Sách Bảo Mật Và Quyền Riêng Tư"),
            leading: Icon(Icons.security),
            onTap: () {
              Get.to(PrivacyPolicy());
            },
          ),
          Divider(thickness: 1),ListTile(
            title: Text("Khác"),
            leading: Icon(Icons.speaker),
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
