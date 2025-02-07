import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';

class ResetPasswordController extends GetxController {
  bool _resetPasswordInProgress = false;
  bool get resetPasswordInProgress => _resetPasswordInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> resetPassword(email, otp, String password) async {
    bool isSuccess = false;
    _resetPasswordInProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "OTP": otp,
      "password": password,
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.resetPasswordUrl, body: requestBody);

    if (response.isSuccess) {
      email;
      otp;
      password;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _resetPasswordInProgress = false;
    update();
    return isSuccess;
  }
}
