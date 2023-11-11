import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../../Components/BookCard.dart';
import '../../../Models/BookModel.dart';
import '../../../Models/Data.dart';
import '../../BookDetails/BookDetails.dart';

class SuggestedBooks extends StatefulWidget {
  const SuggestedBooks({super.key});

  @override
  _SuggestedBooksState createState() => _SuggestedBooksState();
}

class _SuggestedBooksState extends State<SuggestedBooks> {
  // Bộ điều khiển cho trường nhập tìm kiếm
  final TextEditingController _searchController = TextEditingController();

  // Danh sách để lưu trữ sách đã xem với timestamp
  List<Map<String, dynamic>> viewedBooks = [];

  // Danh sách để lưu trữ tất cả sách
  List<BookModel> allBooks = [];

  // Danh sách để lưu trữ sách đề xuất dựa trên tìm kiếm
  List<BookModel> suggestedBooks = [];

  // Cờ để xác định liệu có hiển thị tất cả sách hay chỉ là những cuốn sách đã tìm kiếm
  bool showAllBooks = true;

  @override
  void initState() {
    super.initState();
    // Khởi tạo allBooks với dữ liệu từ bookData
    allBooks.addAll(bookData);
    // Tải danh sách sách đã xem từ SharedPreferences
    loadViewedBooks();
  }

  // Tải danh sách sách đã xem từ SharedPreferences
  void loadViewedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final viewed = prefs.getStringList('viewedBooks') ?? [];
    setState(() {
      viewedBooks = viewed.map((itemJson) {
        final item = json.decode(itemJson);
        final book = BookModel.fromJson(json.decode(item['book']));
        final time = item['time'];
        return {
          'book': book,
          'time': time,
        };
      }).toList();
    });
  }

  // Lưu danh sách sách đã xem vào SharedPreferences
  void saveViewedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final viewed = viewedBooks.map((item) {
      final book = item['book'];
      final time = item['time'];
      final bookJson = json.encode(book.toJson());
      return json.encode({
        'book': bookJson,
        'time': time,
      });
    }).toList();
    prefs.setStringList('viewedBooks', viewed);
  }

  // Tìm kiếm sách dựa trên từ khóa đã nhập
  void searchBooks(String keyword) {
    setState(() {
      suggestedBooks.clear();
    });

    if (keyword.isEmpty) {
      // Nếu trường tìm kiếm trống, hiển thị tất cả sách
      showAllBooks = true;
      suggestedBooks.addAll(allBooks);
    } else {
      // Nếu có từ khóa, hiển thị sách phù hợp với từ khóa
      showAllBooks = false;
      for (var book in allBooks) {
        if (book.title!.toLowerCase().contains(keyword.toLowerCase())) {
          setState(() {
            suggestedBooks.add(book);
          });
        }
      }
    }
  }

  // Hiển thị hộp thoại với danh sách sách đã xem
  void showViewedBooksDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sách đã xem'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: viewedBooks.map((item) {
                final book = item['book'];
                final time = item['time'];
                return ListTile(
                  title: Text('${book.title} - $time'),
                  onTap: () {
                    // Chuyển đến trang BookDetails khi nhấp vào sách đã xem
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDetails(book: book),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Đóng'),
            ),
            TextButton(
              onPressed: () {
                // Xoá lịch sử sách đã xem
                setState(() {
                  viewedBooks = [];
                });
                saveViewedBooks();
                Navigator.pop(context);
              },
              child: const Text('Xoá lịch sử'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Nếu showAllBooks là true, hiển thị tất cả sách; ngược lại, hiển thị sách đề xuất
    if (showAllBooks) {
      suggestedBooks.addAll(allBooks);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tìm kiếm sách',
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextField(
              controller: _searchController,
              onChanged: (text) {
                // Tìm kiếm sách khi người dùng nhập
                searchBooks(text);
              },
              onSubmitted: (text) {
                // Xoá nội dung tìm kiếm khi nhấn nút submit
                _searchController.clear();
              },
              decoration: const InputDecoration(
                hintText: 'Tìm kiếm sách...',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                fillColor: Colors.white,
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          // Hiển thị sách trong lưới
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Hiển thị trong một cột
              ),
              itemCount: suggestedBooks.length,
              itemBuilder: (context, index) {
                // Hiển thị từng cuốn sách bằng widget BookCard
                return BookCard(
                  coverUrl: suggestedBooks[index].coverUrl!,
                  title: suggestedBooks[index].title!,
                  ontap: () {
                    // Thêm sách đã nhấp vào vào danh sách đã xem và chuyển đến trang chi tiết của sách
                    addToViewedBooks(suggestedBooks[index]);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDetails(book: suggestedBooks[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      // Floating action button để hiển thị hộp thoại với sách đã xem
      floatingActionButton: FloatingActionButton(
        onPressed: showViewedBooksDialog,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.history),
      ),
    );
  }

  // Thêm một cuốn sách vào danh sách sách đã xem và lưu vào SharedPreferences
  void addToViewedBooks(BookModel book) {
    setState(() {
      viewedBooks.add({
        'book': book,
        'time': getVietnamTime(),
      });
    });
    saveViewedBooks();
  }

  // Lấy thời gian hiện tại ở múi giờ Việt Nam
  String getVietnamTime() {
    final now = DateTime.now();
    final vietnamTime = now.toLocal();
    final formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    return formatter.format(vietnamTime);
  }
}
