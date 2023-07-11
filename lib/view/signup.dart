import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottery/data/services/appwrite_service.dart';
import 'package:lottery/res/color.dart';
import 'package:lottery/res/components/passwordInput.dart';
import 'package:lottery/view_models/signup_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final SignupViewModel _signupViewModel = Get.put(SignupViewModel());
  final _formKey = GlobalKey<FormState>();
  bool _telErrorInput = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                    'ສ້າງບັນຊີໃໝ່',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'ກະລຸນາຕື່ມຂໍ້ມູນເພື່ອສ້າງບັນຊີ',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Color.fromRGBO(0, 117, 255, 1),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: AppColors.gray,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ຊື່-ນາມສະກຸນ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            // TODO: name
                            Obx(
                              () {
                                return TextFormField(
                                  validator: (value) {
                                    if (value == "") {
                                      _signupViewModel.setErrorForm(
                                          "name", true);
                                      return 'Please fill your name';
                                    }
                                    _signupViewModel.setErrorForm(
                                        "name", false);
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    // errorText: 'error',
                                    errorStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        style: BorderStyle.none,
                                        width:
                                            _signupViewModel.errorForm["name"]!
                                                ? 1
                                                : 0,
                                      ),
                                    ),
                                  ),
                                  onChanged: (e) {
                                    _signupViewModel.onChangeName(e);
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'ເບີໂທລະສັບ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            // TODO: tel
                            InternationalPhoneNumberInput(
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
                                _signupViewModel
                                    .onChagePhoneNumber(value.phoneNumber!);
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
                            // Obx(() {
                            //   return TextFormField(
                            //     validator: (value) {
                            //       if (value == "") {
                            //         _signupViewModel.setErrorForm("tel", true);
                            //         return 'Plaese fill your tel';
                            //       }
                            //       _signupViewModel.setErrorForm("tel", false);
                            //       return null;
                            //     },
                            //     inputFormatters: [
                            //       FilteringTextInputFormatter.digitsOnly,
                            //     ],
                            //     keyboardType: TextInputType.phone,
                            //     decoration: InputDecoration(
                            //       errorStyle: TextStyle(
                            //         fontSize: 14,
                            //       ),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //       hintText: "888-888-8888",
                            //       border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.all(
                            //           Radius.circular(10),
                            //         ),
                            //         borderSide: BorderSide(
                            //           style: BorderStyle.none,
                            //           width: _signupViewModel.errorForm["tel"]!
                            //               ? 1
                            //               : 0,
                            //         ),
                            //       ),
                            //     ),
                            //     onChanged: (value) {
                            //       if (_signupViewModel.validNumber(value)) {
                            //         _signupViewModel.onChagePhoneNumber(value);
                            //         print('true');
                            //       } else {
                            //         print('else');
                            //       }
                            //     },
                            //   );
                            // }),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'ລະຫັດຜ່ານ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Obx(() {
                              return PasswordInput(
                                isError:
                                    _signupViewModel.errorForm["password"]!,
                                validator: (value) {
                                  print(
                                      'value 237: $value / ${_signupViewModel.confirmPassword.value}');
                                  if (value !=
                                      _signupViewModel.confirmPassword.value) {
                                    _signupViewModel.setErrorForm(
                                        "password", true);
                                    return 'Password not match';
                                  }
                                  _signupViewModel.setErrorForm(
                                      "password", false);
                                  return null;
                                },
                                onChange: (value) {
                                  _signupViewModel.onChangePassword(value);
                                },
                              );
                            }),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'ຢືນຢັນລະຫັດ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => PasswordInput(
                                isError: _signupViewModel
                                    .errorForm["confirmPassword"]!,
                                onChange: (value) {
                                  _signupViewModel
                                      .onChangeConfirmPassword(value);
                                },
                                validator: (value) {
                                  if (value !=
                                      _signupViewModel.password.value) {
                                    _signupViewModel.setErrorForm(
                                        "confirmPassword", true);
                                    return 'Password not match';
                                  }
                                  _signupViewModel.setErrorForm(
                                      "confirmPassword", false);
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // TODO: submit button
                  ElevatedButton(
                    onPressed: () {
                      // Get.toNamed(RouteName.home_view);
                      // AppwriteService().createUser();
                      print('nameError ${_signupViewModel.nameError.value}');
                      if (_formKey.currentState!.validate()) {
                        _signupViewModel.submitSignup();
                      }
                    },
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
                    child: Text(
                      'ເຂົ້າສູ່ລະບົບ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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
