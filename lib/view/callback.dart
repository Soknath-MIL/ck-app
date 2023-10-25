import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery/view_models/callback.dart';

class CallBackPage extends StatefulWidget {
  const CallBackPage({super.key});

  @override
  State<CallBackPage> createState() => _CallBackPageState();
}

class _CallBackPageState extends State<CallBackPage> {
  final CallbackViewModel _callbackViewModel = Get.put(CallbackViewModel());

  @override
  void initState() {
    _callbackViewModel.getTransactionDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
