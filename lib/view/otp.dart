import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view_models/otp_view_model.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatefulWidget {
  // String verificationId = Get.arguments[1];
  // String phoneNumber = Get.arguments[0];
  String verificationId = Get.arguments[0];
  String phoneNumber = Get.arguments[1];
  Function customCallback = Get.arguments[2];
  OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  OTPViewModel _otpViewModel = Get.put(OTPViewModel());
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      // textStyle: GoogleFonts.poppins(
      //   fontSize: 22,
      //   color: const Color.fromRGBO(30, 60, 87, 1),
      // ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(237, 237, 237, 1),
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
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'ຢືນຢັນລະຫັດ',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'ກະລຸນາຕື່ມລະຫັດ $length ຫຼັກ ທີ່ໄດ້ຮັບຈາກ SMS ທີ່ສົ່ງໄປຍັງເບີ ${widget.phoneNumber}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Pinput(
                      onChanged: (value) {
                        print('value: $value');
                        _otpViewModel.onChangeOTP(value);
                      },
                      // validator: (value) {
                      //   if (value != '555555') {
                      //     return  'error na';
                      //   }
                      //   return null;
                      // },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      length: length,
                      // controller: controller,
                      // focusNode: focusNode,
                      defaultPinTheme: defaultPinTheme,
                      onCompleted: (pin) {
                        setState(() => showError = pin != '5555');
                      },
                      focusedPinTheme: defaultPinTheme.copyWith(
                        height: 68,
                        width: 64,
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: borderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyWith(
                        decoration: BoxDecoration(
                          color: errorColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _otpViewModel.verificationOTP(
                          widget.verificationId, widget.customCallback);
                    },
                    child: Text(
                      'ສົ່ງ OTP ອີກຄັ້ງ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                          70,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        'ກະລຸນາລໍຖ້າ 30 ວິນາທີ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
