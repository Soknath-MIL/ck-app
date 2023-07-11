import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/view_models/forget_password_view_model.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  ForgetPasswordViewModel _forgetPasswordViewModel =
      Get.put(ForgetPasswordViewModel());
  final _formKey = GlobalKey<FormState>();
  bool _telError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, -0.6),
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(0, 229, 255, 0.2),
              ],
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 24),
              Text(
                'ລືມລະຫັດຜ່ານ',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'ກະລຸນາຕື່ມເບີໂທລະສັບເພື່ອສ້າງລະຫັດຜ່ານໃໝ່',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(73, 73, 73, 1),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 233, 233, 1),
                  border: Border.all(
                    width: 1.0,
                    color: Color.fromRGBO(0, 117, 255, 1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ເບີໂທລະສັບ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(73, 73, 73, 1),
                      ),
                    ),
                    SizedBox(height: 8),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        decoration: InputDecoration(
                          // errorText: 'error',
                          errorStyle: TextStyle(
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "888-888-8888",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              style: BorderStyle.none,
                              width: _telError ? 1 : 0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 7) {
                            setState(() {
                              _telError = true;
                            });
                            return "minimum length is 7 digits";
                          }
                          if (value == "") {
                            setState(() {
                              _telError = true;
                            });
                            return "Plaese fill phone number";
                          }
                          setState(() {
                            _telError = false;
                          });
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      // Get.toNamed(RouteName.home_view);
                      // AppwriteService().createUser();
                      // TODO: uncomment on production
                      if (_formKey.currentState!.validate()) {
                        print('click: login 167');
                        _forgetPasswordViewModel.submitForgetPassword();
                        // _loginViewModel.loginWithPhoneAndPassword();
                      }
                    },
                    child: Text(
                      'ເຂົ້າສູ່ລະບົບ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
