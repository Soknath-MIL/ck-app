import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Store {
  final _store = new FlutterSecureStorage();
  final TRANSACTION_ID = 'transactionId';

  void setSomething(String key, String value) async {
    print('set');
    await _store.write(key: key, value: value);
  }

  Future<String> getSomething(String key) async {
    final result = await _store.read(key: key);
    return result ?? "";
  }

  void setTransactionId(String transactionId) {
    _store.write(key: TRANSACTION_ID, value: transactionId);
  }

  Future<String> getTransactionId() async {
    final result = await _store.read(key: TRANSACTION_ID);
    return result ?? "";
  }

  void removeTransactionId() {
    _store.delete(key: TRANSACTION_ID);
  }
}
