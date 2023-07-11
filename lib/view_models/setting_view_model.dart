import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';

class SettingViewModel extends GetxController {
  Future<void> logout() async {
    await AppwriteService().logoutUser();
    // await AppwriteService().checkUser('');
  }
}
