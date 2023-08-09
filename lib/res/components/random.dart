import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:lottery/res/color.dart';

class RandomLottery extends StatefulWidget {
  void Function(int lotteryType, int qty, int price)? onSubmit;
  RandomLottery({
    super.key,
    this.onSubmit,
  });

  @override
  State<RandomLottery> createState() => _RandomLotteryState();
}

class _RandomLotteryState extends State<RandomLottery> {
  final inputStyle = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 4,
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: AppColors.greye0e0e0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.black.withOpacity(0.6),
      ),
    ),
  );
  FocusNode nodeInputQTY = FocusNode();
  FocusNode nodeInputPrice = FocusNode();
  int lotteryType = 2;
  int qty = 5;
  int price = 1000;
  var controllerInputQTY = MoneyMaskedTextController(
    precision: 0,
    thousandSeparator: ',',
    decimalSeparator: '',
  );
  var controllerInputPrice = MoneyMaskedTextController(
    precision: 0,
    thousandSeparator: ',',
    decimalSeparator: '',
  );

  @override
  void initState() {
    controllerInputQTY.updateValue(double.parse(qty.toString()));
    controllerInputPrice.updateValue(double.parse(price.toString()));
    super.initState();
  }

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
                      overlayColor: MaterialStateProperty.all<Color>(Colors.red.shade400),
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
                Container(
                  margin: EdgeInsets.only(top: 14),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greye0e0e0,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(4),
                    isExpanded: true,
                    isDense: true,
                    underline: Container(),
                    value: lotteryType.toString(),
                    items: ['2', '3'].map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text('จำนวนเลข $e หลัก'),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        lotteryType = int.parse(value!);
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        Text('จำนวนเลขที่สุ่ม'),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5 - 16 - 28,
                          child: TextFormField(
                            controller: controllerInputQTY,
                            // initialValue: qty.toString(),
                            focusNode: nodeInputQTY,
                            decoration: inputStyle,
                            keyboardType: TextInputType.number,
                            onTapOutside: (event) {
                              nodeInputQTY.unfocus();
                            },
                            onChanged: (value) {
                              print('value 86 $value');
                              if (value != '') {
                                setState(() {
                                  qty = int.parse(value);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        Text('จำนวนเงิน'),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5 - 16 - 28,
                          child: TextFormField(
                            controller: controllerInputPrice,
                            // initialValue: price.toString(),
                            focusNode: nodeInputPrice,
                            decoration: inputStyle,
                            keyboardType: TextInputType.number,
                            onTapOutside: (event) {
                              nodeInputPrice.unfocus();
                            },
                            onChanged: (value) {
                              print('value 197 $value');
                              if (value != '') {
                                final parsedValue = value.replaceAll(',', '');
                                print('parsedValue $parsedValue');
                                setState(() {
                                  price = int.parse(parsedValue);
                                });
                              }
                              print('value 86 $value');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 16),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                    child: InkWell(
                      overlayColor: MaterialStateProperty.all(
                        AppColors.primaryOverlay,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (widget.onSubmit != null) {
                          widget.onSubmit!(lotteryType, qty, price);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 74,
                        child: Text(
                          'สุ่มตัวเลข',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
