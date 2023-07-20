import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends GetxController {
  final arrLottery = <Map<String, String>>[].obs;
  final lottery = ''.obs;
  final price = ''.obs;
  final imagesURL = [].obs;
  final lotteryDate = DateTime.now().add(const Duration(minutes: 2)).obs;
  final newsImageURL = [].obs;

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

  Future<List> getAds() async {
    try {
      DocumentList response = await AppwriteService().getAds();
      print('response getAds ${response.documents}');
      response.documents.forEach((element) async {
        List images = element.data['image'];
        final result = jsonDecode(images[0]);
        final response = await http.head(Uri.parse(result['url']));
        print('response 143 ${response.statusCode}');
        if (response.statusCode == 200) {
          imagesURL.add(result['url']);
          print('in loop');
        }
        // if (images.isNotEmpty) {
        //   images.forEach((data) {
        //     print('data 141 $data');
        //   });
        //   // images.add(value)
        // }
      });
      // print('image length: ${imagesURL.length}');
      return imagesURL;
    } catch (e) {
      print('error getAds 135: $e');
      return [];
    }
  }

  Future<void> getNews() async {
    try {
      DocumentList response = await AppwriteService().getNews();
      response.documents.forEach((document) async {
        // print('169 data: ${document.data}');
        final images = document.data['image'];
        final result = jsonDecode(images[0]);
        final response = await http.head(Uri.parse(result['url']));
        if (response.statusCode == 200) {
          newsImageURL.add(result['url']);
        }
        // newsImageURL
      });
    } catch (e) {
      print('error getNews 168 $e');
    }
  }

  Future<dynamic> getLotteryDate() async {
    try {
      DocumentList response = await AppwriteService().getLotteryDate();
      // lotteryDate.value = DateTime.parse(response.documents[0].data['date']);
      // print('first 168 ${DateTime.now().toUtc().toString()}');
      for (var i = 0; i < response.documents.length; i++) {
        final current = DateTime.parse(response.documents[i].data['date']);
        print('current 168 169 $current');
        if (DateTime.now().isBefore(current)) {
          print('found 168');
          lotteryDate.value = current.toUtc();
          break;
        }
        print('index 168 $i');
        final dataPerLoop = response.documents[i];
        print('dataPerLoop 168 ${dataPerLoop.data['date']}');
      }
    } catch (e) {
      print('error getLotteryDate 163: $e');
      return false;
    }
  }
}
