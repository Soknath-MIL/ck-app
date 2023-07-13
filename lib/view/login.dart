import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottery/data/services/appwrite_service.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/components/checkbox.dart';
import 'package:lottery/res/components/passwordInput.dart';
import 'package:lottery/res/images/logo.dart';
import 'package:lottery/res/routes/routes_name.dart';
import 'package:lottery/view_models/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();
  bool _telErrorInput = false;
  bool _passwordErrorInput = false;

  @override
  Widget build(BuildContext context) {
    final marginTop = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(232, 242, 255, 1),
              ],
              begin: Alignment(0.0, -0.6),
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: marginTop.height * 0.03,
                    ),
                    const Image(
                      image: AssetImage(Logo.ckGroup),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'ເຂົ້າສູ່ລະບົບ',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: const Text(
                        'ກະລຸນາຕື່ມເບີໂທລະສັບແລະລະຫັດຜ່ານເພື່ອເຂົ້າສູ່ລະບົບ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: marginTop.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: AppColors.primary,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColors.gray,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ເບີໂທລະສັບ',
                                style: TextStyle(fontSize: 20),
                              ),
                              InternationalPhoneNumberInput(
                                // initialValue: PhoneNumber(
                                //   isoCode: 'LA',
                                // ),
                                countries: ['LA', 'TH'],
                                inputDecoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                      width: _telErrorInput ? 1 : 0,
                                    ),
                                  ),
                                  errorStyle: TextStyle(fontSize: 14),
                                ),
                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                ),
                                onInputChanged: (value) {
                                  print('value 107 $value');
                                  _loginViewModel
                                      .onChangePhoneNumber(value.phoneNumber!);
                                },
                                formatInput: false,
                                validator: (value) {
                                  if (value!.length < 7) {
                                    setState(() {
                                      _telErrorInput = true;
                                    });
                                    return "minimum length is 7 digits";
                                  }
                                  if (value == "") {
                                    setState(() {
                                      _telErrorInput = true;
                                    });
                                    return "Plaese fill phone number";
                                  }
                                  setState(() {
                                    _telErrorInput = false;
                                  });
                                  return null;
                                },
                              ),
                              // TextFormField(
                              //   validator: (value) {},
                              //   decoration: InputDecoration(
                              //     filled: true,
                              //     fillColor: Colors.white,
                              //     hintText: "088-888-8888",
                              //     border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(10),
                              //         ),
                              //         borderSide: BorderSide.none),
                              //   ),
                              // ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'ລະຫັດຜ່ານ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //     filled: true,
                              //     fillColor: Colors.white,
                              //     hintText: "Password",
                              //     border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(10),
                              //         ),
                              //         borderSide: BorderSide.none),
                              //   ),
                              // ),
                              PasswordInput(
                                onChange: (value) {
                                  _loginViewModel.onChangePassword(value);
                                },
                                isError: _passwordErrorInput,
                                validator: (value) {
                                  if (value!.length < 8) {
                                    setState(() {
                                      _passwordErrorInput = true;
                                    });
                                    return "8 character minimum";
                                  }
                                  _passwordErrorInput = false;
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxWithLabel(
                          message: 'ບັນທຶກລະຫັດຜ່ານ',
                          fontSize: 20,
                        ),
                        // TODO: fix forgetpassword
                        // TextButton(
                        //   child: Text(
                        //     'ລືມລະຫັດຜ່ານ',
                        //     style: TextStyle(
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 20,
                        //     ),
                        //   ),
                        //   onPressed: () {
                        //     Get.toNamed(RouteName.forget_password);
                        //   },
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Get.toNamed(RouteName.home_view);
                        // AppwriteService().createUser();
                        // TODO: uncomment on production
                        // if (_formKey.currentState!.validate()) {
                        print('click: login 167');
                        _loginViewModel.loginWithPhoneAndPassword();
                        // }
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
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.tc_view);
                      },
                      child: Text(
                        'ລົງທະບຽນ',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(73, 73, 73, 1)),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(
                            MediaQuery.of(context).size.width,
                            70,
                          ),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
