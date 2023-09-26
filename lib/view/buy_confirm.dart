import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottery/res/color.dart';

class BuyConfirm extends StatefulWidget {
  void Function() onTap;
  void Function() onBack;
  int totalPrice;
  BuyConfirm({
    super.key,
    required this.onTap,
    required this.onBack,
    required this.totalPrice,
  });

  @override
  State<BuyConfirm> createState() => _BuyConfirmState();
}

class _BuyConfirmState extends State<BuyConfirm> {
  final formatter = NumberFormat('#,##,000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Text('buy confirm'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: widget.onBack,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
                      padding: const EdgeInsets.all(0.0),
                      minimumSize: const Size(0, 0),
                      fixedSize: const Size(50, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 28.0,
                      weight: 100,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const Image(image: AssetImage("images/ck-w 1.png")),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.greyf1f0f0,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'ລວມຈໍານວນເງິນ',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18),
                      )),
                      Expanded(
                          child: Text(
                        '${formatter.format(widget.totalPrice)}',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18),
                      )),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'ສ່ວນຫລຸດໂບນັດ',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18),
                      )),
                      Expanded(
                          child: Text(
                        '0',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18),
                      )),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'ລວມຈໍານວນເງິນທີ່ຕ້ອງຊໍາລະ',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        '${formatter.format(widget.totalPrice)}',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 2.0,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: widget.onTap,
                      child: Container(
                        height: 94,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          )
                        ]),
                        child: Image(
                          image: AssetImage('images/bank1.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: widget.onTap,
                      child: Container(
                        height: 94,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          )
                        ]),
                        child: Image(
                          image: AssetImage('images/bank2.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              'ທ່ານມີເວລາໃນການຊໍາລະເງິນ 3 ນາທີ ກ່ອນລະບົບຈະຍົກເລີກອັດຕະໂນມັດ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
