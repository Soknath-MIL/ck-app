import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';

class NotificationViewModel extends GetxController {
  RxList<dynamic> newsList = [].obs;

  Future<dynamic> getNews() async {
    try {
      DocumentList response = await AppwriteService().getNews(10);
      if (newsList.isEmpty) {
        for (var document in response.documents) {
          print('document 10: ${document.data}');
          newsList.add(document.data);
        }
      }
      return response;
    } catch (e) {
      return false;
    }
  }

  void clearNews() {
    newsList.clear();
  }
}
