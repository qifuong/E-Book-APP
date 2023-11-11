import 'package:e_book/Config/Messages.dart';
import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:e_book/Pages/WelcomePage/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Import GetX để quản lý trạng thái và điều hướng

class AuthController extends GetxController {
  RxBool isLoading = false.obs; // Biến để theo dõi trạng thái tải đang diễn ra hay không

  final auth = FirebaseAuth.instance; // Đối tượng Firebase Auth để thực hiện xác thực người dùng

  // Phương thức đăng nhập bằng email và password
  void loginWithEmail() async {
    isLoading.value = true; // Bắt đầu quá trình tải

    try {
      // Đăng nhập bằng tài khoản Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Xác thực người dùng với thông tin đăng nhập từ Google
      await auth.signInWithCredential(credential);

      // Hiển thị thông báo đăng nhập thành công và chuyển hướng đến trang chính
      successMessage('Login Success');
      Get.offAll(const HomePage());
    } catch (ex) {
      // Xử lý nếu có lỗi xảy ra
      if (kDebugMode) {
        print(ex);
      }
      errorMessage("Error ! Try Again");
    }

    isLoading.value = false; // Kết thúc quá trình tải
  }

  // Phương thức đăng xuất
  void signout() async {
    await auth.signOut(); // Đăng xuất người dùng
    successMessage('Logout'); // Hiển thị thông báo đăng xuất thành công
    Get.offAll(const WelcomePage()); // Chuyển hướng đến trang chào mừng
  }
}
