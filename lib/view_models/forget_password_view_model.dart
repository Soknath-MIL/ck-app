import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';
import 'package:lottery/data/services/firebase_service.dart';
import 'package:lottery/res/routes/routes_name.dart';

class ForgetPasswordViewModel extends GetxController {
  final phoneNumber = ''.obs;
  void submitForgetPassword() {
    print('phone: ${phoneNumber.value}');
    AppwriteService().updatePassword('11111111');
    // FirebaseServices()
    //     .loginWithPhoneNumber(phoneNumber.value, gotoUpdatePasswordPage);
  }

  void gotoUpdatePasswordPage() {
    Get.toNamed(RouteName.reset_password, arguments: [phoneNumber]);
  }
}
