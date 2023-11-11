import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Components/FavoriteBooksProvider.dart';
import '../../Components/FavoriteBooksScreen.dart';

// Widget cho phần header của trang chi tiết sách
class BookDetailsHeader extends StatefulWidget {
  final String coverUrl;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String language;
  final String audioLen;

  // Const nhận các thông tin về sách để hiển thị
  const BookDetailsHeader({
    super.key, // Thêm Key? key
    required this.coverUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.pages,
    required this.language,
    required this.audioLen,
  }); // Sử dụng super để gọi constructor của lớp cha

  @override
  _BookDetailsHeaderState createState() => _BookDetailsHeaderState();
}

class _BookDetailsHeaderState extends State<BookDetailsHeader> {
  bool isBookLiked = false;
  bool userTapped = false; // Biến để kiểm tra xem người dùng đã nhấn vào icon chưa

  @override
  void initState() {
    super.initState();
    FavoriteBooksProvider().loadFavoriteBooks();
    isBookLiked = FavoriteBooksProvider().isBookFavorite(widget.title);
  }

  // Mở màn hình FavoriteBooksScreen
  void _openFavoriteBooksScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoriteBooksScreen(favoriteBooks: FavoriteBooksProvider().favoriteBooks, onAddFavorite: (BookModel ) {  },),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        _buildHeaderRow(context),
        const SizedBox(height: 40),
        _buildBookImage(),
        const SizedBox(height: 30),
        _buildBookTitle(),
        _buildBookAuthor(),
        const SizedBox(height: 10),
        _buildBookDescription(),
        _buildBookDetailsRow(),
      ],
    );
  }

  // Xây dựng phần header của trang chi tiết sách
  Widget _buildHeaderRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Nút quay lại
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // Icon trái tim để thêm sách vào danh sách yêu thích
        InkWell(
          onTap: () {
            setState(() {
              userTapped = true; // Người dùng đã nhấn vào icon
              isBookLiked = !isBookLiked;
              FavoriteBooksProvider().toggleFavoriteBook(
                BookModel(
                  title: widget.title,
                  coverUrl: widget.coverUrl,
                  author: widget.author,
                  price: 0, // Thay thế bằng giá trị thực tế cho giá sách
                  rating: widget.rating,
                  totalRating: 0, // Thay thế bằng giá trị thực tế cho tổng số đánh giá
                  dateTime: DateTime.now(),
                ),
              );

              // Kiểm tra nếu cuốn sách được thêm vào yêu thích, thì mở màn hình FavoriteBooksScreen
              if (isBookLiked) {
                _openFavoriteBooksScreen();
              }
            });
          },
          child: SvgPicture.asset(
            "Assets/Icons/heart.svg",
            color: userTapped ? Colors.red : Theme.of(context).colorScheme.background,
          ),
        ),
      ],
    );
  }

  // Xây dựng phần ảnh bìa sách
  Widget _buildBookImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            widget.coverUrl,
            width: 160,
          ),
        ),
      ],
    );
  }

  // Xây dựng phần tiêu đề sách
  Widget _buildBookTitle() {
    return Text(
      widget.title,
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: Theme.of(context).colorScheme.background),
    );
  }

  // Xây dựng phần tác giả sách
  Widget _buildBookAuthor() {
    return Text(
      "Author : ${widget.author}",
      style: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(color: Theme.of(context).colorScheme.background),
    );
  }

  // Xây dựng phần mô tả sách
  Widget _buildBookDescription() {
    return Text(
      widget.description,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(color: Theme.of(context).colorScheme.background),
    );
  }

  // Xây dựng phần chi tiết sách như rating, số trang, ngôn ngữ, và audio length
  Widget _buildBookDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBookDetailsColumn("Rating", widget.rating),
        _buildBookDetailsColumn("Pages", widget.pages),
        _buildBookDetailsColumn("Language", widget.language),
        _buildBookDetailsColumn("Audio", widget.audioLen),
      ],
    );
  }

  // Xây dựng cột cho từng chi tiết sách
  Widget _buildBookDetailsColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
      ],
    );
  }
}
