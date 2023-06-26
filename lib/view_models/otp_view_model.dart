import 'package:get/get.dart';
import 'package:lottery/data/services/firebase_service.dart';

class OTPViewModel {
  final otp = ''.obs;

  Future<void> verificationOTP(String verificationId) async {
    try {
      print('run verificationOTP');
      print('otp: ${otp.value}, verificationId: $verificationId');
      FirebaseServices().loginWithCredential(verificationId, otp.value);
    } catch (e) {
      print('invalid code');
    }
  }

  void onChangeOTP(String value) {
    otp.value = value;
  }
}
