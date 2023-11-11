import 'package:e_book/Components/PrimaryButton.dart';
import 'package:e_book/Controller/AuthController.dart';
import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller cho xác thực
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: Column(
        children: [
          // Phần đầu trang với hình ảnh và thông tin ứng dụng
          Container(
            height: 500,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      // Hình ảnh ứng dụng
                      Image.asset(
                        "Assets/Images/book.png",
                        width: 380,
                      ),
                      const SizedBox(height: 60),
                      // Tiêu đề ứng dụng
                      Text(
                        "E - Book APP",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .background,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Mô tả ứng dụng
                      Flexible(
                        child: Text(
                          "Bạn có thể tìm thấy cuốn sách hay nhất cho mình và bạn cũng có thể đọc sách",
                          textAlign: TextAlign.center,
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
                )
              ],
            ),
          ),
          // Phần ghi chú và thông tin đồ án
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ghi chú",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Đồ án này thực hiện bởi Huynh Thien Bao, Le Minh Hung Và Le Quy Phuong, Nếu có bất kỳ sai sót trong quá trình thực hiện của đồ án, Mong quý thầy cô thông cảm vào bỏ qua, Cảm ơn mọi người",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Phần nút đăng nhập với Google
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PrimaryButton(
              btnName: "LOGIN WITH GOOGLE",
              ontap: () {
                authController.loginWithEmail();
              },
            ),
          )
        ],
      ),
    );
  }
}
