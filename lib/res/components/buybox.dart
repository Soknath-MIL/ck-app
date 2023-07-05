import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/images/logo.dart';

class BuyBox extends StatefulWidget {
  void Function()? onTapInput;
  void Function()? onTapInputPrice;
  int? totalPrice = 0;
  FocusNode? lotteryInputNode;
  FocusNode? lotteryInputNodePrice;
  TextEditingController? lotteryInputController;
  TextEditingController? priceInputController;
  String? lottery = '';
  void Function(String value)? onChangeLottery;
  void Function(String value)? onChangePrice;
  void Function()? onTabAdd;
  void Function()? onSubmit;
  // void Function(int index)? onDeleteItem;

  BuyBox({
    super.key,
    this.onTapInput,
    this.onTapInputPrice,
    this.totalPrice,
    this.lotteryInputNode,
    this.lotteryInputNodePrice,
    this.lottery,
    this.onChangeLottery,
    this.onChangePrice,
    this.onTabAdd,
    this.onSubmit,
    this.lotteryInputController,
    this.priceInputController,
    // this.onDeleteItem,
  });

  @override
  State<BuyBox> createState() => _BuyBoxState();
}

class _BuyBoxState extends State<BuyBox> {
  bool isOpen = false;
  // FocusNode _lotteryInputNode = FocusNode();
  FocusNode _priceInputNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      // padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.amber,
        // border: Border.all(
        //   color: AppColors.greydbdbdb,
        // ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 64,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.greydbdbdb,
                )),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.55 - 17,
                  decoration: BoxDecoration(
                    // color: Colors.brown,
                    border: Border(
                      right: BorderSide(
                        color: AppColors.greydbdbdb,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          // color: AppColors.primary,
                          borderRadius: BorderRadius.circular(52),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Material(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(52),
                          child: InkWell(
                            overlayColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryOverlay),
                            highlightColor: AppColors.primaryHighlight,
                            borderRadius: BorderRadius.circular(52),
                            onTap: () {
                              print('click');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(Logo.animal),
                                ),
                                Text(
                                  'ตำรา',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          // color: AppColors.primary,
                          borderRadius: BorderRadius.circular(52),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Material(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(52),
                          child: InkWell(
                            overlayColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryOverlay),
                            highlightColor: AppColors.primaryHighlight,
                            borderRadius: BorderRadius.circular(52),
                            onTap: () {
                              print('click 119');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage(Logo.shuffle)),
                                Text(
                                  'ສຸ່ມ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Material(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              focusNode: widget.lotteryInputNode,
                              controller: widget.lotteryInputController,
                              onEditingComplete: () {
                                print('completed');
                                widget.lotteryInputNode?.unfocus();
                              },
                              onTap: widget.onTapInput,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ເລກທີຊື້',
                                // filled: true,
                                // fillColor: Colors.amber,
                              ),
                              // autofocus: true,
                              onChanged: widget.onChangeLottery,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45 - 17,
                  decoration: BoxDecoration(
                      // color: Colors.amberAccent,
                      ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Material(
                          child: Container(
                            // decoration:
                            //     BoxDecoration(color: Colors.blue),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              focusNode: widget.lotteryInputNodePrice,
                              controller: widget.priceInputController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ราคา',
                              ),
                              onChanged: widget.onChangePrice,
                              style: TextStyle(
                                fontSize: 24,
                              ),
                              onTap: widget.onTapInputPrice,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 56,
                        height: 56,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          // color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Material(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            highlightColor: AppColors.primaryHighlight,
                            overlayColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryOverlay),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 36,
                            ),
                            onTap: widget.onTabAdd,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 4),
                  width: MediaQuery.of(context).size.width * 0.64,
                  height: 64,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.greydbdbdb)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ລວມທັງໝົດ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${widget.totalPrice != null ? widget.totalPrice : '0'}',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    // style: ButtonStyle(

                    // ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primary,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(
                          MediaQuery.of(context).size.width,
                          52,
                        ),
                      ),
                    ),
                    onPressed: widget.onSubmit,
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
