import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:e_book/Components/MyDrawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

  // Hàm mở URL bằng trình duyệt
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true, // Mở liên kết trong một trang web khác
        enableJavaScript: true, // Cho phép JavaScript (nếu cần)
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  // Hàm xây dựng giao diện hiển thị thông tin thành viên nhóm
  Widget _buildTeamMember(String name, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tên thành viên
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        // Thông tin thành viên
        Text(
          info,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông Tin Nhóm Đồ Án"),
        backgroundColor: Colors.blue,
      ),
      drawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.blue[50],  // Màu nền
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần tiêu đề chào mừng
            const Text(
              "Chào mừng bạn đến với ứng dụng của chúng tôi!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),

            // Phần thông tin nhóm đồ án
            const Text(
              "Đây là đồ án thực hiện bởi nhóm chúng tôi gồm:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // Hiển thị thông tin từng thành viên trong nhóm
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTeamMember("Le Minh Hung", "21748020100xx - VanLangUni"),
                _buildTeamMember("Huynh Thien Bao", "21748020100xx - VanLangUni"),
                _buildTeamMember("Le Quy Phuong", "21748020100xx - VanLangUni"),
              ],
            ),

            const SizedBox(height: 16),

            // Nút xem dự án trên GitHub
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => _launchURL("https://github.com/qifuong/E-Book-APP/"),
                  child: const Text(
                    "Xem dự án trên GitHub",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
