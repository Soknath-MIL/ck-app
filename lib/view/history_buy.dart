import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottery/res/color.dart';

class HistoryBuy extends StatefulWidget {
  RxList<Map<String, List>>? listOfMonth;
  void Function(Map<String, List>?)? onChange;
  RxList<dynamic>? invoiceList;

  HistoryBuy({
    super.key,
    this.listOfMonth,
    this.onChange,
    this.invoiceList,
  });

  @override
  State<HistoryBuy> createState() => _HistoryBuyState();
}

class _HistoryBuyState extends State<HistoryBuy> {
  // final list = ['10,450', '50,000', '50,000', '14,345', '1,000'];
  Map<String, List>? selectedMonth = {};

  @override
  void initState() {
    print('listOfMonth: 20 ${widget.listOfMonth}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          // Obx(() => Text('test: ${widget.listOfMonth}')),
          // Text('test: $selectedMonth, ${selectedMonth!.length}'),
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
                child: Obx(() => DropdownButton(
                      padding: EdgeInsets.all(0),
                      isExpanded: true,
                      underline: Container(),
                      // value: '05-2023',
                      value: selectedMonth!.isNotEmpty
                          ? selectedMonth!
                          : widget.listOfMonth!.isNotEmpty
                              ? widget.listOfMonth![0] as Map<String, List>
                              : Map<String, List>(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      isDense: true,
                      items: widget.listOfMonth!.map((value) {
                        return DropdownMenuItem(
                          child: Container(
                            width: 135,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                // color: Colors.lime,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              '${value.keys.first}',
                              style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.grey7a7a7a),
                            ),
                          ),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                          widget.onChange!(value);
                        });
                      },
                      // onChanged: widget.onChange,
                    )),
              )
            ],
          ),
          SizedBox(height: 8),
          Obx(
            () => Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final localDateTime = DateTime.parse(widget.invoiceList![index]["\$createdAt"]).toLocal();
                                    final date =
                                        '${localDateTime.day.toString().padLeft(2, '0')}/${localDateTime.month.toString().padLeft(2, '0')}/${localDateTime.year}';
                                    final time =
                                        '${localDateTime.hour.toString().padLeft(2, '0')}:${localDateTime.minute.toString().padLeft(2, '0')}:${localDateTime.second}';
                                    return Text('วันที่ $date เวลาซื้อ $time');
                                  },
                                ),
                                SizedBox(height: 4),
                                Text('เลขที่บิลหวย: ${widget.invoiceList![index]["\$id"]}'),
                              ],
                            ),
                            Builder(builder: (context) {
                              final formatter = NumberFormat('#,##,000');
                              final totalPrice = formatter.format(widget.invoiceList![index]["totalAmount"]);
                              return Text(
                                totalPrice,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(249, 49, 55, 1),
                                ),
                              );
                            }),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('เลขที่ซื้อ'),
                            SizedBox(width: 8),
                            Expanded(
                              child: Builder(builder: (context) {
                                List<dynamic> lotteryArray = widget.invoiceList![index]["lotteryArray"];
                                // lotteryArray.map((lottery) {
                                //   print('per loop 153: $lottery');
                                // });
                                return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 6.0,
                                  children: lotteryArray.map((lottery) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      alignment: Alignment.center,
                                      width: 74,
                                      child: Text(
                                        '$lottery',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.gray2,
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(),
                itemCount: widget.invoiceList == null ? 0 : widget.invoiceList!.length,
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.separated(
          //     itemBuilder: (context, index) {
          //       return Container(
          //         margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          //         padding: EdgeInsets.all(16),
          //         width: MediaQuery.of(context).size.width,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(10),
          //           ),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.grey.withOpacity(0.5),
          //               spreadRadius: 1,
          //               blurRadius: 5,
          //               offset: Offset(0, 3),
          //             )
          //           ],
          //         ),
          //         child: Column(
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text('วันที่ 12/05/2023 เวลาซื้อ 14:02:39'),
          //                     SizedBox(
          //                       height: 4,
          //                     ),
          //                     Text('เลขที่บิลหวย: 20230512000000001234'),
          //                   ],
          //                 ),
          //                 Text(
          //                   '${list[index]}',
          //                   style: TextStyle(
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.bold,
          //                     color: Color.fromRGBO(249, 49, 55, 1),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 8,
          //             ),
          //             Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text('เลขที่ซื้อ'),
          //                 SizedBox(
          //                   width: 8,
          //                 ),
          //                 Expanded(
          //                   child: Wrap(
          //                     spacing: 8.0,
          //                     runSpacing: 6.0,
          //                     children: ['1', '2', '4', '5', '6', '7'].map((e) {
          //                       return Container(
          //                         padding: EdgeInsets.symmetric(vertical: 8),
          //                         alignment: Alignment.center,
          //                         width: 74,
          //                         child: Text(
          //                           '123456',
          //                           style: TextStyle(fontSize: 14),
          //                         ),
          //                         decoration: BoxDecoration(
          //                           color: AppColors.gray2,
          //                           borderRadius: BorderRadius.all(Radius.circular(5)),
          //                         ),
          //                       );
          //                     }).toList(),
          //                   ),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //       );
          //     },
          //     separatorBuilder: (context, index) => SizedBox(),
          //     itemCount: list.length,
          //   ),
          // )
        ],
      ),
    );
  }
}
