import 'package:flutter/material.dart';
import 'package:e_book/Components/MyDrawer.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chính Sách Và Quyền Riêng Tư"),
        backgroundColor: Colors.blue,
      ),
      drawer: const MyDrawer(), // Sử dụng widget MyDrawer làm drawer của trang
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chính Sách Quyền Riêng Tư",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            // Mô tả chính sách quyền riêng tư
            Text(
              "Dưới đây là chính sách quyền riêng tư cho ứng dụng của chúng tôi. Chúng tôi cam kết bảo vệ thông tin cá nhân của bạn và sử dụng nó một cách hợp pháp.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              "Chúng tôi có thể thu thập và lưu trữ các thông tin cá nhân sau đây:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            // Liệt kê các thông tin cá nhân có thể thu thập
            Text(
              "- Tên và thông tin liên hệ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              "- Thông tin về thiết bị của bạn",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              "- Thông tin về việc sử dụng ứng dụng",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            // Mô tả cách chúng tôi sử dụng thông tin cá nhân
            Text(
              "Chúng tôi sử dụng thông tin cá nhân này để cải thiện dịch vụ của mình và cung cấp cho bạn trải nghiệm tốt hơn.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              "Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu về chính sách quyền riêng tư, vui lòng liên hệ với chúng tôi.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            // Thông tin liên hệ
            Text(
              "Email: contact@example.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            Text(
              "Điện thoại: +091812356",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            Text(
              "Địa chỉ: 69/68 Đ. Đặng Thuỳ Trâm, Phường 13, Bình Thạnh, Thành phố Hồ Chí Minh 70000",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
