import 'package:flutter/material.dart';
import 'package:e_book/Pages/AddNewBook/AddNewBook.dart';

class AdminVerificationPage extends StatefulWidget {
  const AdminVerificationPage({super.key});

  @override
  _AdminVerificationPageState createState() => _AdminVerificationPageState();
}

class _AdminVerificationPageState extends State<AdminVerificationPage> {
  String adminPassword = "123456";
  TextEditingController passwordController = TextEditingController();
  String errorMessage = "";
  String successMessage = "";
  String adminMessage = "";

  TextEditingController popupPasswordController = TextEditingController(); // Thêm một TextEditingController riêng cho popup

  void verifyAdmin() {
    String userInput = passwordController.text;
    if (userInput == "Hung") {
      // Người dùng "Hung" sẽ bị chuyển về trang trước đó
      Navigator.pop(context);
    } else if (userInput == "Phuong") {
      // Hiển thị hộp thoại nhập mật khẩu cho admin
      popupPasswordController.text = ""; // Đặt giá trị ban đầu cho passwordController của popup
      showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: const Text("Xác minh Admin"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Vui lòng nhập mật khẩu cho admin:"),
                    TextField(
                      controller: popupPasswordController, // Sử dụng TextEditingController riêng cho popup
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Mật khẩu",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    Text(
                      adminMessage,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (popupPasswordController.text == adminPassword) { // Sử dụng TextEditingController của popup
                        setState(() {
                          successMessage = "Xác minh thành công!";
                          adminMessage = "Mật khẩu đúng!";
                          errorMessage = "";
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const AddNewBookPage()),
                          );
                          popupPasswordController.text = ""; // Đặt lại giá trị của TextEditingController của popup
                          setState(() {
                            successMessage = "";
                            adminMessage = "";
                          });
                        });
                      } else {
                        setState(() {
                          errorMessage = "Mật khẩu không đúng. Vui lòng thử lại.";
                          adminMessage = "";
                        });
                      }
                    },
                    child: const Text("Xác minh"),
                  ),
                ],
              );
            },
          );
        },
      );
    } else {
      setState(() {
        errorMessage = "Tên Admin không đúng. Vui lòng thử lại.";
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          errorMessage = "";
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xác minh"),
        backgroundColor: Colors.blue, // Màu nền của AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Xin chào, vui lòng nhập tên của Admin:",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Tên Admin",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyAdmin,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Màu chữ trên nút
                ),
                child: const Text("Xác minh"),
              ),
              const SizedBox(height: 10),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
              Text(
                successMessage,
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
