import 'package:flutter/material.dart';
import 'package:e_book/Components/MyDrawer.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key});

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
              "Chính sách quyền riêng tư dành cho ứng dụng của những nhà phát triển không phải thuộc Google",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Set the title color
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Để giúp bạn quyết định nên tải ứng dụng nào xuống trên Android, các nhà phát triển bên thứ ba có thể bao gồm liên kết đến chính sách quyền riêng tư trên trang chi tiết của ứng dụng của họ trên Google Play. Google cung cấp trường tùy chọn này cho những nhà phát triển muốn chia sẻ chính sách quyền riêng tư của họ với người dùng. Các chính sách quyền riêng tư này là do nhà phát triển viết và không được Google đánh giá.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Set the text color
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Không phải tất cả ứng dụng Android trên Google Play đều đăng chính sách quyền riêng tư. Nếu ứng dụng có chính sách quyền riêng tư, bạn có thể tìm chính sách đó trên trang chi tiết của ứng dụng trong Google Play.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Set the text color
              ),
            ),
            Text(
              "Nguồn: https://support.google.com/",
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
