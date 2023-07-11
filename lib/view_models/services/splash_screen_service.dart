import 'dart:async';

import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';
import 'package:lottery/res/routes/routes_name.dart';

class SplashServices {
  Future<void> isLogin() async {
    final response = await AppwriteService().checkUser();
    print('response isLogin $response');
    if (response) {
      Timer(const Duration(seconds: 3), () => Get.toNamed(RouteName.main_view));
    } else {
      Timer(
          const Duration(seconds: 3), () => Get.toNamed(RouteName.login_view));
    }
  }
}
