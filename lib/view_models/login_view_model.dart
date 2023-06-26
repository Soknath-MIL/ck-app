import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  Future<UserCredential?> loginWithPhoneNumber(String phoneNumber) async {
    print('login function');
    FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential userCredential;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          userCredential = await _auth.signInWithCredential(credential);
          print('success!');
          print(userCredential.user?.phoneNumber);
          // return userCredential;
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        // codeSent: (String verificationId, int? resendToken) {},
        codeSent: (String verificationId, int? resendToken) async {
          // เก็บ verificationId เพื่อใช้ในการยืนยันรหัสยืนยัน
          String smsCode = '123456'; // รหัสยืนยันจำลอง (สำหรับการทดสอบเท่านั้น)
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );
          userCredential = await _auth.signInWithCredential(credential);
          print('success ${userCredential.user?.phoneNumber}');
          print('user ${userCredential.user.toString()}');
          // return userCredential;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Code Auto Retrieval Timeout');
        },
      );
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  void logout() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signOut();
      print('signout!');
    } catch (e) {
      print('error: ${e.toString()}');
    }
  }

  void updatePassword() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    // await _auth.currentUser?.updatePassword('123456');
    print('update password ${_auth.currentUser?.updateDisplayName('sawanon')}');
  }
}
