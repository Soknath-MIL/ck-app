import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';
import 'package:lottery/data/services/firebase_service.dart';
import 'package:lottery/res/routes/routes_name.dart';

class OTPViewModel {
  final otp = ''.obs;

  Future<void> verificationOTP(
      String verificationId, Function customCallback) async {
    try {
      print('run verificationOTP');
      print('otp: ${otp.value}, verificationId: $verificationId');
      final isSuccess = await FirebaseServices()
          .loginWithCredential(verificationId, otp.value);
      if (isSuccess) {
        customCallback();
        // AppwriteService().createUser(email, password, name)
      }
    } catch (e) {
      print('invalid code');
    }
  }

  void onChangeOTP(String value) {
    otp.value = value;
  }
}
