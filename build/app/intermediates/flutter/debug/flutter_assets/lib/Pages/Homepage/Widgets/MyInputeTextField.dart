import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'SearchPage.dart';

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Row(
            children: [
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoogleSearchPage()),
                  );
                },
                child: SvgPicture.asset("Assets/Icons/search.svg"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search here . .",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
