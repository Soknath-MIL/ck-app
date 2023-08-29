import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottery/data/services/appwrite_service.dart';

class SettingViewModel extends GetxController {
  final name = ''.obs;
  final tel = ''.obs;
  final email = ''.obs;
  final avatar = ''.obs;

  final rating = ''.obs;
  final comment = ''.obs;

  Future<void> logout() async {
    await AppwriteService().logoutUser();
    // await AppwriteService().checkUser('');
  }

  Future<void> getUserInfo() async {
    try {
      final response = await AppwriteService().getUserInfo();
      print('response 15: ${response['name']}');
      name.value = response['name'];
      tel.value = response['tel'];
      email.value = response['email'];
      try {
        final avatarJSON = jsonDecode(response['avatar']);
        avatar.value = avatarJSON['url'];
      } catch (e) {
        print('avatar is null');
      }
    } catch (e) {
      print('error getUserInfo 18');
    }
  }

  void onChangeRating(String value) {
    rating.value = value;
  }

  void onChangeComment(String value) {
    comment.value = value;
  }

  Future<void> submitFeedback(context) async {
    try {
      print('rating ${rating.value}');
      print('comment: ${comment.value}');
      final response = await AppwriteService().createFeedback(
        rating.value,
        comment.value,
      );
      print('submitFeedback: response 44 $response');
      Navigator.pop(context);
    } catch (e) {
      print('submitFeedback error 48: $e');
    }
  }
}
