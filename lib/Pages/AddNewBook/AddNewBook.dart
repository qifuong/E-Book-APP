import 'package:e_book/Components/BackButton.dart';
import 'package:e_book/Components/MutiLineTextFormField.dart';
import 'package:e_book/Components/MyTextFormField.dart';
import 'package:e_book/Config/Colors.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Controller/PdfController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Widget để thêm mới sách
class AddNewBook extends StatelessWidget {
  const AddNewBook({super.key});

  @override
  Widget build(BuildContext context) {
    // Tạo các controllers cho việc quản lý dữ liệu và logic
    TextEditingController controller = TextEditingController();
    PdfController pdfController = Get.put(PdfController());
    BookController bookController = Get.put(BookController());

    return Scaffold(
      // Scaffold chứa toàn bộ cấu trúc UI
      body: SingleChildScrollView(
        // SingleChildScrollView cho phép cuộn nếu nội dung vượt quá màn hình
        child: Column(
          children: [
            // Phần đầu tiên của giao diện
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        // Dòng tiêu đề và nút quay lại
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MyBackButton(),
                            Text(
                              "ADD NEW BOOK ADMIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background,
                              ),
                            ),
                            const SizedBox(width: 40),
                          ],
                        ),
                        const SizedBox(height: 60),
                        // Phần chọn ảnh bìa sách
                        InkWell(
                          onTap: () {
                            bookController.pickImage();
                          },
                          child: Obx(
                                () => Container(
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: Center(
                                child: bookController.isImageUploading.value
                                    ? const CircularProgressIndicator(
                                  color: primaryColor,
                                )
                                    : bookController.imageUrl.value == ""
                                    ? Image.asset(
                                    "Assets/Icons/addImage.png")
                                    : ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  child: Image.network(
                                    bookController.imageUrl.value,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Phần nhập thông tin sách
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Phần chọn file PDF
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                              () => Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: bookController.pdfUrl.value == ""
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bookController.isPdfUploading.value
                                ? const Center(
                              child: CircularProgressIndicator(
                                color: backgroudColor,
                              ),
                            )
                                : bookController.pdfUrl.value == ""
                                ? InkWell(
                              onTap: () {
                                bookController.pickPDF();
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "Assets/Icons/upload.png"),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Book PDF",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : InkWell(
                              onTap: () {
                                bookController.pdfUrl.value = "";
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "Assets/Icons/delete.png",
                                      width: 20),
                                  SizedBox(width: 8),
                                  Text(
                                    "Delete Pdf",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Các trường nhập thông tin sách
                  MyTextFormField(
                    hintText: "Tựa Đề",
                    icon: Icons.book,
                    controller: bookController.title,
                  ),
                  const SizedBox(height: 10),
                  MultiLineTextField(
                    hintText: "Mô Tả Sách",
                    controller: bookController.des,
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    hintText: "Tên Tác Giả",
                    icon: Icons.person,
                    controller: bookController.auth,
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    hintText: "Thông Tin Tác Giả",
                    icon: Icons.person,
                    controller: bookController.aboutAuth,
                  ),
                  const SizedBox(height: 10),
                  // Dòng nhập giá và số trang
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          isNumber: true,
                          hintText: "Mã Giảm Giá",
                          icon: Icons.currency_rupee,
                          controller: bookController.price,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: MyTextFormField(
                          hintText: "Số Trang",
                          isNumber: true,
                          icon: Icons.book,
                          controller: bookController.pages,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Dòng nhập ngôn ngữ và thời lượng audio
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          hintText: "Ngôn Ngữ",
                          icon: Icons.language,
                          controller: bookController.language,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: MyTextFormField(
                          hintText: "Audio Len (coming soon)",
                          icon: Icons.audiotrack,
                          controller: bookController.audioLen,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Dòng nút "Huỷ" và "Đăng"
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back(); // Quay lại màn hình trước đó
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: Colors.red,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Huỷ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Obx(
                              () => Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bookController.isPdfUploading.value
                                ? const Center(
                              child: CircularProgressIndicator(),
                            )
                                : InkWell(
                              onTap: () {
                                bookController.createBook();
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload_sharp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Đăng",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
