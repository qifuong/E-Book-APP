import 'package:flutter/material.dart';
import 'package:e_book/Pages/AddNewBook/AddNewBook.dart';

class AdminVerificationPage extends StatefulWidget {
  const AdminVerificationPage({Key? key}) : super(key: key);

  @override
  _AdminVerificationPageState createState() => _AdminVerificationPageState();
}

class _AdminVerificationPageState extends State<AdminVerificationPage> {
  // Mật khẩu admin để kiểm tra
  String adminPassword = "123456";

  // Controller để quản lý nội dung nhập vào ô "Tên Admin"
  TextEditingController passwordController = TextEditingController();

  // Thông báo lỗi và thành công
  String errorMessage = "";
  String successMessage = "";

  // Thông báo đặc biệt cho admin
  String adminMessage = "";

  // Số lần nhập sai mật khẩu
  int wrongPasswordCount = 0;

  // Trạng thái đóng băng xác minh
  bool isVerificationFrozen = false;

  // Controller cho ô mật khẩu trong popup
  TextEditingController popupPasswordController = TextEditingController();

  // Thông báo lỗi trong popup
  String popupErrorMessage = "";

  // Số lần nhập sai mật khẩu trong popup
  int wrongPopupPasswordCount = 0;

  // Trạng thái đóng băng xác minh trong popup
  bool isPopupVerificationFrozen = false;

  // Biến tạm để lưu giữ tên admin khi người dùng nhập vào ô "Tên Admin"
  String temporaryAdminName = "";

  @override
  void initState() {
    super.initState();
    // Xóa giá trị trong ô "Tên Admin" khi trang được khởi tạo
    passwordController.clear();
  }

  // Hàm xác minh admin
  void verifyAdmin() {
    // Lưu giữ tên admin từ ô "Tên Admin"
    temporaryAdminName = passwordController.text;

    // Kiểm tra xem xác minh có đang đóng băng không
    if (isVerificationFrozen) {
      return;
    }

    // Lấy giá trị từ ô "Tên Admin"
    String userInput = temporaryAdminName;

    // Kiểm tra xem tên admin có đúng không
    if (userInput == "Hung") {
      Navigator.pop(context);
    } else if (userInput == "Phuong") {
      // Xử lý khi nhập sai mật khẩu quá 5 lần
      if (wrongPasswordCount >= 5) {
        errorMessage =
        "Bạn đã nhập sai mật khẩu quá nhiều lần. Chức năng đã bị đóng băng.";
        setState(() {});
        Future.delayed(const Duration(seconds: 5), () {
          errorMessage = "";
          wrongPasswordCount = 0;
          isVerificationFrozen = false;
          setState(() {});
          Navigator.popUntil(
            context,
            ModalRoute.withName(''), // Quay lại trang gốc
          );
        });
        return;
      }

      // Thiết lập giá trị ban đầu cho ô mật khẩu trong popup
      popupPasswordController.text = "";

      // Hiển thị hộp thoại xác minh
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
                      popupErrorMessage,
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
                      // Kiểm tra xem xác minh trong popup có đang đóng băng không
                      if (isPopupVerificationFrozen) {
                        popupErrorMessage =
                        "Chức năng đã bị đóng băng. Vui lòng thử lại sau.";
                        setState(() {});
                        return;
                      }

                      // Xác minh mật khẩu admin
                      if (popupPasswordController.text == adminPassword) {
                        successMessage = "Xác minh thành công!";
                        adminMessage = "Mật khẩu đúng!";
                        popupErrorMessage = "";
                        errorMessage = "";
                        setState(() {});

                        // Đợi 3 giây rồi chuyển đến trang thêm sách mới
                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddNewBook(),
                            ),
                          );

                          // Xóa giá trị trong ô mật khẩu popup
                          popupPasswordController.clear();
                          successMessage = "";
                          adminMessage = "";
                          setState(() {});
                        });
                      } else {
                        // Xử lý khi nhập sai mật khẩu trong popup
                        popupErrorMessage =
                        "Mật khẩu không đúng. Vui lòng thử lại.";
                        adminMessage = "";
                        wrongPopupPasswordCount++;
                        setState(() {});

                        // Hiển thị cảnh báo khi nhập sai 3 lần
                        if (wrongPopupPasswordCount == 3) {
                          popupErrorMessage =
                          "Bạn đã nhập sai mật khẩu 3 lần.";
                          setState(() {});
                        }

                        // Đóng băng xác minh trong popup khi nhập sai 5 lần
                        if (wrongPopupPasswordCount == 5) {
                          popupErrorMessage =
                          "Bạn đã nhập sai mật khẩu 5 lần. Chức năng đã bị đóng băng.";
                          isPopupVerificationFrozen = true;
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
      // Xử lý khi tên admin không đúng
      errorMessage = "Tên Admin không đúng. Vui lòng thử lại.";
      adminMessage = "";
      wrongPasswordCount++;
      setState(() {});

      // Hiển thị cảnh báo khi nhập sai 3 lần
      if (wrongPasswordCount == 3) {
        errorMessage = "Cảnh Báo !!! Bạn đã nhập sai mật khẩu 3 lần.";
        setState(() {});
      }

      // Đóng băng xác minh khi nhập sai 5 lần
      if (wrongPasswordCount == 5) {
        errorMessage =
        "Bạn đã nhập sai mật khẩu 5 lần. Chức năng đã bị đóng băng.";
        isVerificationFrozen = true;
        Future.delayed(const Duration(seconds: 5), () {
          errorMessage = "";
          wrongPasswordCount = 0;
          isVerificationFrozen = false;
          setState(() {});
          Navigator.popUntil(
            context,
            ModalRoute.withName(''), // Quay lại trang gốc
          );
        });
      }
    }
  }

  @override
  void dispose() {
    // Xóa giá trị trong ô "Tên Admin" khi trang bị hủy
    passwordController.clear();
    temporaryAdminName = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {});
        return true;
      },
      child: Scaffold(
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
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
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
      ),
    );
  }
}
