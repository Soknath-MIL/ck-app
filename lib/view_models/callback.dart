import 'package:get/get.dart';
import 'package:lottery/data/store.dart';
import 'package:http/http.dart' as http;

class CallbackViewModel extends GetxController {
  void getTransactionDetail() async {
    final _store = Store();
    final transactionId = await _store.getTransactionId();
    print('transactionId: $transactionId');
    final response = await http.get(Uri.parse('https://mule-guiding-liger.ngrok-free.app/transactions/$transactionId'));
    print('getTransactionDetail:  ${response.body}');
  }
}
