import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';

class LotteryHistory {
  DateTime date;
  String lottery;

  LotteryHistory(this.date, this.lottery);

  String toDateLocal() {
    final localDate = date.toLocal();
    return "${localDate.day.toString().padLeft(2, '0')}/${localDate.month.toString().padLeft(2, '0')}/${localDate.year}";
  }
}

class LotteryHistoryViewModel extends GetxController {
  RxList<LotteryHistory> lotteryHistory = RxList<LotteryHistory>();
  List<LotteryHistory> lotteryData = [];

  Future<dynamic> getLotteryHistory() async {
    try {
      DocumentList response = await AppwriteService().getLotteryHistory();
      print('start');
      for (var e in response.documents) {
        print('response 10: ${e.data}');
        // lotteryHistory.add(e);
        final data = e.data;
        final lotteryPerLoop = LotteryHistory(DateTime.parse(data["date"]), data["lottery_number"].toString());
        // lotteryData.add(lotteryPerLoop);
        lotteryHistory.add(lotteryPerLoop);
      }
      return true;
    } catch (e) {
      print('error getLotteryHistory 30: $e');
      return false;
    }
  }
}
