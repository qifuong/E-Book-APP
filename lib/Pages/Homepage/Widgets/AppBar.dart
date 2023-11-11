import 'package:e_book/Config/Colors.dart';
import 'package:e_book/Controller/AuthController.dart';
import 'package:e_book/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// Widget này là thanh AppBar ở góc trên bên trái của trang chính (home)
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Sử dụng AuthController từ GetX để quản lý trạng thái đăng nhập và thông tin người dùng
    AuthController authController = Get.put(AuthController());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Icon dashboard (drawer) để mở thanh điều hướng
        InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: SvgPicture.asset("Assets/Icons/dashboard.svg"),
        ),
        // Tiêu đề "E-BOOK"
        Text(
          "E-BOOK",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        // Ảnh đại diện và tên người dùng để mở trang thông tin cá nhân
        InkWell(
          onTap: () {
            Get.to(const ProfilePage());
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(authController.auth.currentUser!.photoURL!),
            ),
          ),
        ),
      ],
    );
  }
}
