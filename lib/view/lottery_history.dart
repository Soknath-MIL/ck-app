import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view_models/lottery_history_view_model.dart';

class LotteryHistoryPage extends StatefulWidget {
  const LotteryHistoryPage({super.key});

  @override
  State<LotteryHistoryPage> createState() => _LotteryHistoryPageState();
}

class _LotteryHistoryPageState extends State<LotteryHistoryPage> {
  LotteryHistoryViewModel _lotteryHistoryViewModel = Get.put(LotteryHistoryViewModel());

  final winNumber = ['988493', '343555', '394232', '343555', '988493', '394232'];

  @override
  void initState() {
    if (_lotteryHistoryViewModel.lotteryHistory.isEmpty) {
      _lotteryHistoryViewModel.getLotteryHistory();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('งวดวันที่ ${_lotteryHistoryViewModel.lotteryHistory[index].toDateLocal()}'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _lotteryHistoryViewModel.lotteryHistory[index].lottery.split('').map((e) {
                      return Container(
                        padding: EdgeInsets.all(3),
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.yellowGradient,
                              AppColors.redGradient,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                e,
                                style: TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
          itemCount: _lotteryHistoryViewModel.lotteryHistory.length,
          separatorBuilder: (context, index) {
            return SizedBox();
          },
        ),
      )),
    );
  }
}
