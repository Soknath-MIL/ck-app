import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lottery/res/color.dart';

class RandomLottery extends StatefulWidget {
  const RandomLottery({super.key});

  @override
  State<RandomLottery> createState() => _RandomLotteryState();
}

class _RandomLotteryState extends State<RandomLottery> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(12),
            // height: 50,
            decoration: BoxDecoration(
              color: AppColors.blue9aedff,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text('สุ่มเลข'),
                Container(
                  width: 30,
                  height: 30,
                  child: Material(
                    color: AppColors.redClose,
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.red.shade400),
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                DropdownButton(
                  isExpanded: true,
                  items: [2, 3].map((e) {
                    return DropdownMenuItem(
                      child: Text('จำนวนเลข $e หลัก'),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (value) {
                    print('onChange 73 $value');
                  },
                ),
                Row(
                  children: [
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        Text('จำนวนเลขที่สุ่ม'),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              print('value 86 $value');
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text('data1'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
