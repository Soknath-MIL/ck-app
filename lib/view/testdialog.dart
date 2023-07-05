import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/images/logo.dart';

class TestDialog extends StatefulWidget {
  const TestDialog({super.key});

  @override
  State<TestDialog> createState() => _TestDialogState();
}

class _TestDialogState extends State<TestDialog> {
  bool isOpen = false;
  showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Visibility(
                      child: Text('top'),
                      visible: isOpen,
                    ),
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Column(
                      children: [
                        Container(
                          height: 64,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.55 -
                                        16,
                                decoration: BoxDecoration(
                                    // color: Colors.brown,
                                    border: Border(
                                        right: BorderSide(
                                  color: AppColors.greydbdbdb,
                                ))),
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
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColors.primaryOverlay),
                                          highlightColor:
                                              AppColors.primaryHighlight,
                                          borderRadius:
                                              BorderRadius.circular(52),
                                          onTap: () {
                                            print('click');
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColors.primaryOverlay),
                                          highlightColor:
                                              AppColors.primaryHighlight,
                                          borderRadius:
                                              BorderRadius.circular(52),
                                          onTap: () {
                                            print('click 119');
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                  image:
                                                      AssetImage(Logo.shuffle)),
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
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 6),
                                          child: TextFormField(
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
                                            autofocus: true,
                                            onChanged: (e) {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.45 -
                                        16,
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
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'ราคา',
                                            ),
                                            onChanged: (value) {},
                                            style: TextStyle(
                                              fontSize: 24,
                                            ),
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
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          highlightColor:
                                              AppColors.primaryHighlight,
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColors.primaryOverlay),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 36,
                                          ),
                                          onTap: () {
                                            print('tab 221');
                                            setState(() {
                                              isOpen = !isOpen;
                                            });
                                          },
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
                          height: 64,
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
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ລວມທັງໝົດ',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '0',
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
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      AppColors.primary,
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                      Size(
                                        MediaQuery.of(context).size.width,
                                        64,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'ยืนยัน',
                                    style: TextStyle(
                                      fontSize: 16,
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
                  )
                ],
              ),
            ),
          );
        });
        // return Dialog(
        //   surfaceTintColor: Colors.white,
        //   alignment: Alignment.bottomCenter,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //   ),
        //   // backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        //   child: Container(
        //     // decoration: BoxDecoration(color: Colors.amber),
        //     padding: EdgeInsets.all(16.0),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Text(
        //           'Custom Dialog',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 18.0,
        //           ),
        //         ),
        //         SizedBox(height: 16.0),
        //         Text('This is a custom dialog.'),
        //         SizedBox(height: 16.0),
        //         TextFormField(
        //           autofocus: true,
        //           onChanged: (e) {},
        //         ),
        //         ElevatedButton(
        //           onPressed: () {
        //             Navigator.of(context).pop(); // Close the dialog
        //           },
        //           child: Text('Close'),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 52,
            width: 52,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(52)),
            child: Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(52),
              child: InkWell(
                overlayColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryOverlay),
                highlightColor: AppColors.primaryHighlight,
                borderRadius: BorderRadius.circular(52),
                child: Text('test'),
                onTap: () {
                  print('gogo;');
                },
              ),
            ),
          ),
          ElevatedButton(
            child: Text('click'),
            onPressed: () {
              showCustomDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
