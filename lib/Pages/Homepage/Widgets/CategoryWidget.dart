import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

// Widget để hiển thị một loại (category) trong ứng dụng, bao gồm biểu tượng, tên và có thể có một liên kết URL
class CategoryWidget extends StatelessWidget {
  final String iconPath;  // Đường dẫn của biểu tượng (icon) cho loại
  final String btnName;   // Tên của loại
  final String? url;       // Liên kết URL tương ứng với loại, có thể là null

  const CategoryWidget({Key? key, required this.iconPath, required this.btnName, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          // Nếu có liên kết URL, mở nó khi người dùng chạm vào loại
          if (url != null && url!.isNotEmpty) {
            launchURL(url);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Row(
            children: [
              SvgPicture.asset(iconPath),  // Hiển thị biểu tượng (icon) từ đường dẫn
              const SizedBox(width: 10),
              Text(btnName),  // Hiển thị tên của loại
            ],
          ),
        ),
      ),
    );
  }

  // Phương thức để mở liên kết URL trong trình duyệt web
  Future<void> launchURL(String? url) async {
    if (url != null && url.isNotEmpty) {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true, enableJavaScript: true); // Mở URL trong trình duyệt web cụ thể
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
