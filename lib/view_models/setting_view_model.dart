import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';

class SettingViewModel extends GetxController {
  final name = ''.obs;
  final tel = ''.obs;
  final email = ''.obs;

  Future<void> logout() async {
    await AppwriteService().logoutUser();
    // await AppwriteService().checkUser('');
  }

  Future<void> getUserInfo() async {
    try {
      final response = await AppwriteService().getUserInfo();
      print('response 15: ${response['name']}');
      name.value = response['name'];
      tel.value = response['tel'];
      email.value = response['email'];
    } catch (e) {
      print('error getUserInfo 18');
    }
  }
}
