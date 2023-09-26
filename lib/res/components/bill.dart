import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/images/logo.dart';

class Bill extends StatelessWidget {
  Bill({super.key});
  final name = "Sawanon";
  final datetime = DateTime.now();
  final tel = '+66121231234';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 28),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.greyd9d9d9,
                            width: 1,
                          ),
                        ),
                      ),
                      child: const Text(
                        'ກະຊວງການເງິນ ຫວຍພັດທະນາ ຈັດຈໍາໜ່າຍໂດຍ CK GROUP',
                        style: TextStyle(
                          color: AppColors.textGray,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.redClose,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage(Logo.main),
                  height: 112,
                ),
                SizedBox(height: 16),
                Image(image: AssetImage(Logo.ckGroup)),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ผู้ซื้อ: $name',
                      style: TextStyle(
                        color: AppColors.blue0075FF,
                      ),
                    ),
                    Text(
                      'วันที่ ${datetime.day.toString().padLeft(2, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.year}',
                      style: TextStyle(
                        color: AppColors.blue0075FF,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'โทรศัพท์ $tel',
                      style: TextStyle(
                        color: AppColors.blue0075FF,
                      ),
                    ),
                    Text(
                      'เวลา ${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}:${datetime.second.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: AppColors.blue0075FF,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
