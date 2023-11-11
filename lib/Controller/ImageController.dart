import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageController extends GetxController {
  ImagePicker imagePicker = ImagePicker(); // Đối tượng ImagePicker để chọn ảnh

  // Hàm để chọn ảnh từ thư viện
  void pickImage() async {
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var uuid = const Uuid();
      var fileName = uuid.v1(); // Tạo ID duy nhất cho tệp tin
      var response = FirebaseStorage.instance.ref().child("Image/$fileName"); // Tham chiếu đến đường dẫn lưu trữ trên Firebase Storage
      if (kDebugMode) {
        print(response.storage.ref().getDownloadURL()); // In ra URL tải về của tệp tin
      }
    }
  }
}
