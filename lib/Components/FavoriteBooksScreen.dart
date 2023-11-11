import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Components/FavoriteBooksProvider.dart';

class FavoriteBooksScreen extends StatefulWidget {
  final List<BookModel> favoriteBooks;
  final Function(BookModel) onAddFavorite;

  const FavoriteBooksScreen({
    Key? key,
    required this.favoriteBooks,
    required this.onAddFavorite,
  }) : super(key: key);

  @override
  _FavoriteBooksScreenState createState() => _FavoriteBooksScreenState();
}

class _FavoriteBooksScreenState extends State<FavoriteBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Books'),
        backgroundColor: Colors.blue,
      ),
      body: widget.favoriteBooks.isEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Kính thưa quý độc giả,\n\nCảm ơn các bạn đã yêu thích và ủng hộ sách, ứng dụng của tôi. Sự đánh giá cao của bạn có nghĩa là cả thế giới đối với tôi!\n\nNếu bạn có bất kỳ câu hỏi nào hoặc cần hỗ trợ, vui lòng liên hệ với chúng tôi.\n\nPhone: Le Minh Hung - 0908512356',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  _copyToClipboard('support@example.com');
                },
                child: Text(
                  'Email: support@example.com (Ấn để sao chép)',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _showCallForwardDialog(context);
                },
                child: Text('Liên hệ'),
              ),
            ],
          ),
        ),
      )
          : ListView.builder(
        itemCount: widget.favoriteBooks.length,
        itemBuilder: (context, index) {
          BookModel book = widget.favoriteBooks[index];
          return ListTile(
            title: Text(
              book.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showCallForwardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return _CountdownDialog();
      },
    );
  }

  void _copyToClipboard(String content) {
    Clipboard.setData(ClipboardData(text: content));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Email đã được sao chép')),
    );
  }
}

class _CountdownDialog extends StatefulWidget {
  @override
  _CountdownDialogState createState() => _CountdownDialogState();
}

class _CountdownDialogState extends State<_CountdownDialog> {
  int countdown = 5;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (countdown > 1) {
        setState(() {
          countdown -= 1;
        });
        startCountdown();
      } else {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cuộc gọi sẽ được chuyển tiếp'),
      content: Text('Vui lòng đợi. Đếm ngược: $countdown'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
