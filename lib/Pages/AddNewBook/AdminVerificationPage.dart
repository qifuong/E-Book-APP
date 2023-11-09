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
  int wrongPasswordCount = 0;
  bool isVerificationFrozen = false;

  TextEditingController popupPasswordController = TextEditingController();
  String popupErrorMessage = "";

  void verifyAdmin() {
    if (isVerificationFrozen) {
      return;
    }

    String userInput = passwordController.text;
    if (userInput == "Hung") {
      Navigator.pop(context);
    } else if (userInput == "Phuong") {
      if (wrongPasswordCount >= 5) {
        errorMessage = "Bạn đã nhập sai mật khẩu quá nhiều lần. Chức năng đã bị đóng băng.";
        setState(() {});
        Future.delayed(const Duration(seconds: 5), () {
          errorMessage = "";
          wrongPasswordCount = 0;
          isVerificationFrozen = false;
          setState(() {});
          Navigator.pop(context); // Chuyển người dùng về trang trước đó sau 5 giây
        });
        return;
      }
      popupPasswordController.text = "";
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
                      controller: popupPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Mật khẩu",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      popupErrorMessage, // Hiển thị thông báo lỗi trong hộp thoại
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
                      if (popupPasswordController.text == adminPassword) {
                        successMessage = "Xác minh thành công!";
                        adminMessage = "Mật khẩu đúng!";
                        popupErrorMessage = ""; // Xóa thông báo lỗi
                        errorMessage = ""; // Xóa thông báo lỗi trong trang chính
                        setState(() {});
                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const AddNewBook()),
                          );
                          popupPasswordController.clear();
                          successMessage = "";
                          adminMessage = "";
                          setState(() {});
                        });
                      } else {
                        popupErrorMessage = "Mật khẩu không đúng. Vui lòng thử lại.";
                        adminMessage = "";
                        wrongPasswordCount++;
                        setState(() {});

                        if (wrongPasswordCount == 3) {
                          popupErrorMessage = "Bạn đã nhập sai mật khẩu 3 lần.";
                          setState(() {});
                        }

                        if (wrongPasswordCount == 5) {
                          popupErrorMessage = "Bạn đã nhập sai mật khẩu 5 lần. Chức năng đã bị đóng băng.";
                          isVerificationFrozen = true;
                          setState(() {});
                        }
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
      errorMessage = "Tên Admin không đúng. Vui lòng thử lại.";
      adminMessage = "";
      wrongPasswordCount++;
      setState(() {});

      if (wrongPasswordCount == 3) {
        errorMessage = "Cảnh Báo !!! Bạn đã nhập sai mật khẩu 3 lần.";
        setState(() {});
      }

      if (wrongPasswordCount == 5) {
        errorMessage = "Bạn đã nhập sai mật khẩu 5 lần. Chức năng đã bị đóng băng.";
        isVerificationFrozen = true;
        Future.delayed(const Duration(seconds: 5), () {
          errorMessage = "";
          wrongPasswordCount = 0;
          isVerificationFrozen = false;
          setState(() {});
          Navigator.pop(context); // Chuyển người dùng về trang trước đó sau 5 giây
        });
      }
    }
  }

  @override
  void dispose() {
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xác minh"),
        backgroundColor: Colors.blue,
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
                onPressed: wrongPasswordCount < 5 ? verifyAdmin : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
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
