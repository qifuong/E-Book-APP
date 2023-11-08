import 'package:e_book/Components/MyDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
    );
  }
}