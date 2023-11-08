import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:e_book/Components/MyDrawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông Tin Nhóm Đồ Án"),
        backgroundColor: Colors.blue,
      ),
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chào mừng bạn đến với ứng dụng của chúng tôi!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Đây là đồ án thực hiện bởi nhóm chúng tôi gồm:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            _buildTeamMember("Le Minh Hung", "21748020100xx - VanLangUni"),
            _buildTeamMember("Huynh Thien Bao", "21748020100xx - VanLangUni"),
            _buildTeamMember("Le Quy Phuong", "21748020100xx - VanLangUni"),
            SizedBox(height: 16),
            TextButton(
              onPressed: () => _launchURL("https://github.com/qifuong/E-Book-APP/"),
              child: Text(
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
      ),
    );
  }

  Widget _buildTeamMember(String name, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
