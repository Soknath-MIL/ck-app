import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';
import 'package:lottery/data/services/firebase_service.dart';
import 'package:lottery/res/routes/routes_name.dart';

class SignupViewModel extends GetxController {
  final name = ''.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final formKey = GlobalKey<FormState>();
  final RxMap<String, bool> errorForm = RxMap<String, bool>({
    "name": false,
    "tel": false,
    "password": false,
    "confirmPassword": false,
  });
  final nameError = false.obs;

  void onChangeName(String value) {
    print('name 1: ${name.value}');
    name.value = value;
    print('name 2: ${name.value}');
  }

  void onChagePhoneNumber(String value) {
    print('phoneNumber 1: ${phoneNumber.value}');
    phoneNumber.value = value;
    print('phoneNumber 2: ${phoneNumber.value}');
  }

  void onChangePassword(String value) {
    print('password 1: ${password.value}');
    password.value = value;
    print('password 2: ${password.value}');
  }

  void onChangeConfirmPassword(String value) {
    print('confirmPassword 1: ${confirmPassword.value}');
    confirmPassword.value = value;
    print('confirmPassword 2: ${confirmPassword.value}');
  }

  void submitSignup() {
    print('name: ${name.value}');
    print('phone: ${phoneNumber.value}');
    print('password: ${password.value}');
    print('confirmPassword: ${confirmPassword.value}');
    print('pass !');
    FirebaseServices().loginWithPhoneNumber('+66968908467', createUser);
    // AppwriteService().createUser(
    //     '${phoneNumber.value}@test.com', password.value, name.value);
  }

  void createUser() async {
    print('createUser run !');
    final email = '${phoneNumber.value}@ckmail.com';
    final isSuccess =
        await AppwriteService().createUser(email, password.value, name.value);

    if (isSuccess) {
      Get.snackbar('Success', 'signUp successfully');
      Get.toNamed(RouteName.login_view);
    }
  }

  bool validFormSignup() {
    if (formKey.currentState!.validate()) {
      print('correct form');
      // if (password.value != confirmPassword.value) {
      //   Get.snackbar(
      //     'Warning!',
      //     'Password not match',
      //     // backgroundColor: Co,
      //     // colorText: Colors.white,
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      //   return false;
      // }
      return true;
    }
    print('error form 68 !');
    return false;
  }

  bool validNumber(value) {
    try {
      if (value == "") {
        return true;
      }
      int.parse(value);
      return true;
    } catch (e) {
      print('error validNumber SignupViewModel: $e');
      return false;
    }
  }

  void setErrorForm(String key, bool value) {
    errorForm[key] = value;
  }
}
