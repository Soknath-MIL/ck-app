import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';

class HistoryViewModel extends GetxController {
  RxMap<String, List> listOfMonthMap = RxMap<String, List>();
  RxList<Map<String, List>> listOfMonth = RxList<Map<String, List>>();
  RxList selectedMonth = [].obs;

  Future<dynamic> getHistory() async {
    try {
      final response = await AppwriteService().getHistory();
      print('response 7: $response');
      (response as Map).forEach((key, value) {
        print('value 10: $value');
        listOfMonthMap[key] = value;
        listOfMonth.add({key: value});
      });
      print('listOfMonth 19 $listOfMonth');
      // listOfMonthMap = response;
      // return response;
    } catch (e) {
      print('error getHistory 11: $e');
      return false;
    }
  }

  Future<dynamic> getInvoice(List collectionList) async {
    try {
      final invoiceList = [];
      for (var i = 0; i < collectionList.length; i++) {
        final collectionId = collectionList[i];
        // print('collectionId 30: $collectionId, is ${collectionId is String}');
        DocumentList response = await AppwriteService().getInvoice(collectionId);
        print('response 31: ${response.documents}');
        response.documents.forEach((element) {
          invoiceList.add(element.data);
          selectedMonth.add(element.data);
        });
      }
      if (invoiceList.isEmpty) {
        selectedMonth.clear();
      }
      print('invoiceList 39: $invoiceList');
      print('length ${invoiceList.length}');
      // selectedMonth = invoiceList;
    } catch (e) {
      print('error getInvoice 35: $e');
      return false;
    }
  }
}
