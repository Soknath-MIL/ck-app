import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
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

  void removeAllLottery() {
    arrLottery.clear();
  }

  void getArrLottery() {
    print(arrLottery);
  }

  bool validateLottery() {
    if (arrLottery.isEmpty) {
      return false;
    }
    return true;
  }

  Future<bool> craeteTransaction() async {
    try {
      // print('boom');
      // print(arrLottery);

      // return;
      final validdation = validateLottery();
      if (validdation == false) {
        print('false');
        return false;
      }
      print('true');
      // final arrTransactionId = [];
      final arrLotterise = [];
      final arrAmount = [];
      final arrLotteryType = [];
      int totalAmount = 0;
      // final invoiceId = ID.unique();
      // print('invoice ID: $invoiceId, ${invoiceId == 'uniques()'}');
      // return;

      for (var i = 0; i < arrLottery.length; i++) {
        final lottery = arrLottery[i]['lottery']!;
        final amount = int.parse(arrLottery[i]['price']!);
        // arrTransactionId.add(ID.unique());
        arrLotterise.add(lottery);
        arrAmount.add(amount);
        arrLotteryType.add(lottery.length);
        totalAmount += amount;
      }
      // print('arrTransactionId $arrTransactionId');
      // print('arrLotterise: $arrLotterise');
      // return;

      final responseFromCreateInvoice = await AppwriteService().createInvoice(
        arrLotterise,
        arrAmount,
        arrLotteryType,
        totalAmount,
      );
      print('responseFromCreateInvoice $responseFromCreateInvoice');
      if (responseFromCreateInvoice != false) {
        Document newResponseCreateInvoice = responseFromCreateInvoice;
        final invoiceId = newResponseCreateInvoice.$id;
        print('data: ${newResponseCreateInvoice.data}');
        // print('invoiceId: $invoiceId');
        // return;
        for (var i = 0; i < arrLottery.length; i++) {
          final lottery = arrLottery[i]['lottery']!;
          final amount = int.parse(arrLottery[i]['price']!);
          Document responseFromCreateTransaction = await AppwriteService()
              .createTransaction(lottery, amount, invoiceId);
          final transactionsData = {
            'id': responseFromCreateTransaction.$id,
            'amount': responseFromCreateTransaction.data['amount'],
            'users': responseFromCreateTransaction.data['users']['userId'],
          };
          await AppwriteService().createAccumulate(
            lottery,
            amount,
            '$transactionsData',
            // '${responseFromCreateTransaction.data}',
            // {
            //   id:
            // }
          );
          // if (response != false) {
          //   Document newResponse = response;
          //   print('response ${newResponse.$id}');
          //   // arrTransactionId.add(newResponse.$id);
          //   // arrLotterise.add(lottery);
          //   // arrAmount.add(amount);
          //   // arrLotteryType.add(lottery.length);
          //   // totalAmount += amount;
          // }
        }
        // print('array transactionId $arrTransactionId');
      }
      return true;
    } catch (e) {
      print('error createTransaction 45: $e');
      return false;
    }
  }
}
