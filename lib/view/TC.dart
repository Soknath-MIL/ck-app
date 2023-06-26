import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/routes/routes_name.dart';

class TC extends StatelessWidget {
  const TC({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -0.6),
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(0, 229, 255, 0.2),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                      left: 16, top: 24, right: 16, bottom: 16),
                  width: screenSize.width,
                  height: screenSize.height - 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1.0,
                        color: const Color.fromRGBO(214, 214, 214, 1),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("การใช้บริการ:"),
                      ElevatedButton(
                        child: Text(
                          'ຍອມຮັບ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(RouteName.signup_view);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.primary,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
