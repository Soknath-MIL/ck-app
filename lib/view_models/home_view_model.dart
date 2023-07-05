import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';

class HomeViewModel extends GetxController {
  final arrLottery = <Map<String, String>>[].obs;
  final lottery = ''.obs;
  final price = ''.obs;

  void onChangeLottery(String value) {
    lottery.value = value;
  }

  void onChangePrice(String value) {
    price.value = value;
  }

  void appendLottery(String lottery, String price) {
    arrLottery.add({
      "lottery": lottery,
      "price": price,
    });
  }

  void removeLottery(int index) {
    arrLottery.removeAt(index);
  }

  void getArrLottery() {
    print(arrLottery);
  }

  Future<void> craeteTransaction() async {
    print('boom');
    final response = await AppwriteService().createTransaction('1234', 4444);
    print('response $response');
  }
}
