import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:e_book/Pages/WelcomePage/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance; // Firebase Auth để kiểm tra trạng thái đăng nhập

  @override
  void onInit() {
    super.onInit();
    splaceController();
  }

  // Hàm chuyển hướng dựa trên trạng thái đăng nhập
  void splaceController() {
    Future.delayed(const Duration(seconds: 4), () {
      if (auth.currentUser != null) {
        Get.offAll(const HomePage()); // Nếu đã đăng nhập, chuyển đến trang chủ
      } else {
        Get.offAll(const WelcomePage()); // Nếu chưa đăng nhập, chuyển đến trang chào mừng
      }
    });
  }
}
