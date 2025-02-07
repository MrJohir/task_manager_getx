import 'dart:convert';
import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';
import 'package:flutter/services.dart';

class UpdateProfileController extends GetxController {
  bool _updateProfileInProgress = false;

  bool get updateProfileInProgress => _updateProfileInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> updateProfile(
    String email,
    String firstName,
    String lastName,
    String mobile,
    Uint8List? pickedImage,
    String? password,
  ) async {
    bool isSuccess = false;
    _updateProfileInProgress = true;
    update();
    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
    };

    if (pickedImage != null) {
      List<int> imageBytes = pickedImage;
      requestBody['photo'] = base64Encode(imageBytes);
    }

    if (password != null) {
      requestBody['password'] = password;
    }

    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.updateProfileUrl,
      body: requestBody,
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _updateProfileInProgress = false;
    update();
    return isSuccess;
  }
}






// Future<bool> pickImage() async {
//   ImagePicker picker = ImagePicker();
//   XFile? image = await picker.pickImage(source: ImageSource.gallery);
//   if (image != null) {
//     _pickedImage = image;
//     setState(() {});
//   }
// }