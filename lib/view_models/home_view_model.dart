import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';
import 'package:http/http.dart' as http;
import 'package:lottery/data/store.dart';
import 'package:url_launcher/url_launcher.dart';

String parsedLotteryDate(DateTime date) {
  return '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
}

class HomeViewModel extends GetxController {
  final arrLottery = <Map<String, String>>[].obs;
  final lottery = ''.obs;
  final price = ''.obs;
  final imagesURL = [].obs;
  final lotteryDate = DateTime.now().add(const Duration(minutes: 2)).obs;
  final newsImageURL = [].obs;
  final quota = RxMap<String, dynamic>();
  List<Quota> listQuota = [];

  void onChangeLottery(String value) {
    lottery.value = value;
  }

  void onChangePrice(String value) {
    price.value = value;
  }

  bool appendLottery(String lottery, String price) {
    // TODO: check quota
    // print('listQuota: ${listQuota[1].quota[0]}');
    final priceParsed = int.parse(price);
    if (priceParsed < 1000) {
      Get.snackbar(
        "คำเตือน!",
        "ขั้นต่ำ 1,000",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        backgroundColor: Colors.amber.shade100,
        animationDuration: Duration(milliseconds: 500),
      );
      return false;
    }
    if (lottery.length < 2) {
      Get.snackbar(
        "คำเตือน!",
        "กรุณากรอกเลขตั้งแต่ 2 - 3 ตัว",
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        backgroundColor: Colors.amber.shade100,
        animationDuration: Duration(milliseconds: 500),
      );
      return false;
    }
    // print("appendLottery 33: ");
    arrLottery.add({
      "lottery": lottery,
      "price": price,
    });
    return true;
  }

  void removeLottery(int index) {
    arrLottery.removeAt(index);
  }

  void removeAllLottery() {
    arrLottery.clear();
  }

  List<Map<String, String>> getArrLottery() {
    return arrLottery;
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
      final lotteryDateString =
          "${lotteryDate.value.year}${lotteryDate.value.month.toString().padLeft(2, '0')}${lotteryDate.value.day.toString().padLeft(2, '0')}";
      final responseFromCreateInvoice = await AppwriteService().createInvoice(
        arrLotterise,
        arrAmount,
        arrLotteryType,
        totalAmount,
        lotteryDateString,
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
          Document responseFromCreateTransaction =
              await AppwriteService().createTransaction(lottery, amount, invoiceId, lotteryDateString);
          final transactionsData = {
            'id': responseFromCreateTransaction.$id,
            'amount': responseFromCreateTransaction.data['amount'],
            'users': responseFromCreateTransaction.data['users']['userId'],
          };
          await AppwriteService().createAccumulate(
            lottery,
            amount,
            '$transactionsData',
            lotteryDateString,
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
      if (newsImageURL.isEmpty) {
        DocumentList response = await AppwriteService().getNews(3);
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
      }
    } catch (e) {
      print('error getNews 168 $e');
    }
  }

  Future<dynamic> getLotteryDate() async {
    try {
      print('start getLotteryDate');
      DocumentList response = await AppwriteService().getLotteryDate();
      // lotteryDate.value = DateTime.parse(response.documents[0].data['date']);
      // print('first 168 ${DateTime.now().toUtc().toString()}');
      for (var i = 0; i < response.documents.length; i++) {
        final current = DateTime.parse(response.documents[i].data['date']);
        print('current 168 169 $current');
        if (DateTime.now().isBefore(current)) {
          // print('found 168');
          lotteryDate.value = current.toLocal();
          await getQuota(current.toLocal());
          // print('current lottery date 194: ${current.toLocal()}');
          break;
        }
        // print('index 168 $i');
        // final dataPerLoop = response.documents[i];
        // print('dataPerLoop 168 ${dataPerLoop.data['date']}');
      }
    } catch (e) {
      print('error getLotteryDate 163: $e');
      return false;
    }
  }

  Future<void> getQuota(DateTime lotteryDate) async {
    try {
      final lotteryDateParsed = parsedLotteryDate(lotteryDate);
      print('lotteryDateParsed 220: $lotteryDateParsed');
      final responseQuota = await AppwriteService().getQuota(lotteryDateParsed);
      print('responseQuota 224: $responseQuota');
      listQuota = responseQuota!;
    } catch (e) {
      print('error getQuota 219: $e');
    }
  }

  void launchDeepLink(Uri deepLink) async {
    if (await canLaunchUrl(deepLink)) {
      await launchUrl(deepLink);
    } else {
      print('error launchDeepLink 264: ');
      // Handle the error, e.g., show a snackbar or navigate to an error page.
    }
  }

  Future<void> getAccessToken() async {
    // final store = Store();
    // // store.setSomething('key', '123');
    // final result = await store.getSomething('key');
    // print('result: $result');

    // return;
    try {
      print('start getAccessToken');
      final response = await http.post(
        Uri.parse('https://mule-guiding-liger.ngrok-free.app/buy'),
        body: {
          'data': '123',
        },
      );
      print('response 278: ${response.body}');
      final deeplink = jsonDecode(response.body)['data']['deeplinkUrl'];
      final transactionId = jsonDecode(response.body)['data']['transactionId'];

      print('response ${deeplink}');
      final _deeplink = Uri.parse("$deeplink");
      final result = await launchUrl(_deeplink);
      final _store = Store();
      _store.setTransactionId(transactionId);
      print('result: ${result}');
      // launchDeepLink(deeplink);
      // await _launchUrl(Uri.);
    } catch (e) {
      print('error: getAccessToken $e');
    }
  }

  Future<void> getTransactionDetail() async {
    //
  }
}
