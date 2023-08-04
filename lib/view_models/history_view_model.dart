import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';

class HistoryViewModel extends GetxController {
  Future<void> getHistory() async {
    try {
      final response = await AppwriteService().getHistory();
      print('response 7: $response');
    } catch (e) {
      print('error getHistory 11: $e');
    }
  }
}
