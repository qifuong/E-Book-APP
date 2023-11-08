import 'package:flutter/material.dart';
import 'package:e_book/Components/MyDrawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chính Sách Và Quyền Riêng Tư"),
        backgroundColor: Colors.blue, // Set the app bar background color
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thông Tin Thêm Về Nhóm Đồ Án",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Set the title color
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Đồ án này thực hiện bởi Huynh Thien Bao, Le Minh Hung Và Le Quy Phuong, Nếu có bất kỳ sai sót trong quá trình thực hiện của đồ án, Mong quý thầy cô thông cảm vào bỏ qua, Cảm ơn mọi người.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Set the text color
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Le Minh Hung - 21748020100xx - VanLangUni",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Set the text color
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Huynh Thien Bao - 21748020100xx - VanLangUni",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black, // Set the text color
              ),
            ),SizedBox(height: 10),
            Text(
              "Le Quy Phuong - 21748020100xx - VanLangUni",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Set the text color
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Nguồn: https://github.com/qifuong/E-Book-APP/",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red, // Set the text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
