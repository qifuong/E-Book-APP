import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookTile extends StatelessWidget {
  final String title;
  final String coverUrl;
  final String author;
  final int price;
  final String rating;
  final int totalRating;
  final VoidCallback ontap;
  final String numberofRating;

  const BookTile({
    super.key,
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.price,
    required this.rating,
    required this.totalRating,
    required this.ontap,
    required this.numberofRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(-2, -2),
                    )
                  ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      coverUrl,
                      width: 100,
                    ),
                  )),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      maxLines: 10,
                      style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 4),
                  Text("By: $author",
                      style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 4),
                  Text(
                    "Mã Giảm Giá: $price",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("Assets/Icons/star.svg"),
                      Text(rating, style: Theme.of(context).textTheme.bodyMedium),
                      Text("($totalRating Rating)",
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
