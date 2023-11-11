import 'package:e_book/Components/BackButton.dart';
import 'package:e_book/Controller/PdfController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// Widget để hiển thị trang chi tiết sách dưới dạng PDF
class BookPage extends StatefulWidget {
  final String bookUrl;

  // Constructor nhận đường dẫn của sách để hiển thị
  const BookPage({super.key, required this.bookUrl});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    // Khởi tạo PdfController sử dụng GetX để quản lý trạng thái của PDF viewer
    PdfController pdfController = Get.put(PdfController());

    return Scaffold(
      appBar: AppBar(
        // Nút quay lại với màu nền chủ đề
        leading: BackButton(
          color: Theme.of(context).colorScheme.background,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Tiêu đề trang chi tiết sách
        title: Text(
          "Book title",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        centerTitle: true,
      ),
      // Nút bookmark để mở danh sách bookmark trong PDF
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pdfController.pdfViewerKey.currentState?.openBookmarkView();
        },
        child: Icon(
          Icons.bookmark,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      // Sử dụng SfPdfViewer để hiển thị PDF từ đường dẫn mà widget nhận được
      body: SfPdfViewer.network(
        widget.bookUrl, // Sử dụng đường dẫn sách được cung cấp trong const
        key: pdfController.pdfViewerKey,
      ),
    );
  }
}
