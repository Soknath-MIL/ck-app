import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/res/color.dart';

class HistoryWin extends StatefulWidget {
  const HistoryWin({super.key});

  @override
  State<HistoryWin> createState() => _HistoryWinState();
}

class _HistoryWinState extends State<HistoryWin> {
  final winNumber = ['988493', '343555', '394232'];
  final arrNumber = [
    ['2345', '35', '456', '123456', '1234', '93', '99', '12345', '4325'],
    ['2345', '35', '456', '123456', '1234', '93', '55'],
    ['123432', '1234', '93', '99', '12343', '4325'],
  ];

  Color checkWin(String buyNumber, String winNumber) {
    final cutNumber = winNumber.substring(winNumber.length - buyNumber.length);
    print(
        'buyNumber: $buyNumber, winNumber: $winNumber, cutNumber: $cutNumber');
    if (cutNumber == buyNumber) {
      return AppColors.winContainer;
    }
    return AppColors.gray2;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: AppColors.greye0e0e0,
                    width: 2,
                  )),
              width: 135,
              child: DropdownButton<String>(
                padding: EdgeInsets.all(0),
                isExpanded: true,
                underline: Container(),
                value: '05-2023',
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                isDense: true,
                items:
                    ['05-2023', '06-2023'].map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    child: Container(
                      width: 135,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          // color: Colors.lime,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        e,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey7a7a7a),
                      ),
                    ),
                    value: e,
                  );
                }).toList(),
                onChanged: (e) {},
              ),
            )
          ],
        ),
        SizedBox(height: 8),
        Expanded(
          // height: MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(color: Colors.black26),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('งวดวันที่ 10-05-2023')],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: winNumber[index].split('').map((e) {
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
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      height: 1,
                      color: AppColors.greyd9d9d9,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('วันที่ 10/05/2023 เวลาซื้อ 13:05:55'),
                            SizedBox(height: 4),
                            Text('เลขที่บิลหวย: 20230512000000001232'),
                          ],
                        ),
                        Text(
                          '50,000',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(249, 49, 55, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('เลขที่ซื้อ'),
                        SizedBox(width: 8),
                        Expanded(
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 6.0,
                            children: arrNumber[index].map((arrNumberInLoop) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: checkWin(
                                      arrNumberInLoop, winNumber[index]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 8),
                                width: 74,
                                alignment: Alignment.center,
                                child: Text(
                                  arrNumberInLoop,
                                  style: TextStyle(fontSize: 14),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: winNumber.length,
          ),
        ),
      ],
    );
  }
}

// Row(
//   children: [
//     Expanded(
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Container(
//             width: 100, // กำหนดความกว้างของรายการ
//             color: Colors.blue, // สีพื้นหลังของรายการ
//             child: Center(
//               child: Text('Item $index'),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return SizedBox(
//               width:
//                   10); // กำหนดขนาดช่องว่างระหว่างรายการ
//         },
//         itemCount: 3, // จำนวนรายการ
//       ),
//     ),
//   ],
// )
// Row(
//   children: [
//     Container(
//       decoration: BoxDecoration(color: Colors.amber),
//       height: 56,
//       width: MediaQuery.of(context).size.width -
//           ((16 * 2) + (8 * 2)),
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, indexPerNumber) {
//           return Container(
//             padding: EdgeInsets.all(3),
//             width: 56,
//             height: 56,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100),
//               gradient: LinearGradient(
//                 colors: [
//                   AppColors.yellowGradient,
//                   AppColors.redGradient,
//                 ],
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//               ),
//             ),
//             child: Center(
//               child: Container(
//                 width: double.maxFinite,
//                 height: double.maxFinite,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.circular(100),
//                 ),
//                 child: Center(
//                   child: Text(
//                     // '${winNumber[index].split('')[indexPerNumber]}',
//                     '1',
//                     style: TextStyle(fontSize: 32),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (context, indexPerNumber) {
//           return SizedBox();
//         },
//         itemCount: winNumber[index].split('').length,
//       ),
//     )
//   ],
// ),
