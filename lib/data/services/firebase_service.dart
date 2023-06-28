import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lottery/res/routes/routes_name.dart';

class FirebaseServices {
  Future<UserCredential?> loginWithPhoneNumber(
      String phoneNumber, Function customCallback) async {
    print('run: checkUser in FirebaseServices');

    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          print('complete checkUserByPhone 12 $credential');
        },
        verificationFailed: (FirebaseAuthException e) {
          print('error: checkUserByPhone 15 ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          print('codeSent 1: $verificationId');
          print('codeSent 2: $resendToken');
          Get.toNamed(RouteName.otp_view,
              arguments: [verificationId, phoneNumber, customCallback]);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('codeAutoRetrievalTimeout: $verificationId');
        },
      );
      // print('response checkUserByPhone : $response');
    } catch (e) {
      print('error checkUser in FirebaseServices: $e');
    }
  }

  Future<bool> loginWithCredential(
      String verificationId, String otpCode) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpCode);
      final response = await _auth.signInWithCredential(credential);
      print('response loginWithCredential: ${response}');
      if (response.user != null) {
        return true;
      }
      return false;
    } catch (e) {
      print('error: loginWithCredential $e');
      return false;
    }
  }
}
