import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';


class CategoryWidget extends StatelessWidget {
  final String iconPath;
  final String btnName;
  final String? url;

  const CategoryWidget({Key? key, required this.iconPath, required this.btnName, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
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
              SvgPicture.asset(iconPath),
              const SizedBox(width: 10),
              Text(btnName),
            ],
          ),
        ),
      ),
    );
  }

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
