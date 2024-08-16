import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/view/auth/sign_in_screen.dart';

class TeacherSignupController extends GetxController {
  Rx<TextEditingController> namecontroller = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  Rx<TextEditingController> addController = TextEditingController().obs;
  Rx<TextEditingController> passsController = TextEditingController().obs;
  Rx<TextEditingController> schoolNameController = TextEditingController().obs;

  final _obscureText = true.obs;
  bool get obscureText => _obscureText.value;

  void toggleObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  Future<void> signUp() async {
    final fullName = namecontroller.value.text;
    final email = emailController.value.text;
    final address = addController.value.text;
    final password = passsController.value.text;
    final schoolName = schoolNameController.value.text;

    try {
      final dio = Dio();
      final response = await dio.post(
        'https://testapi/user/signup',
        data: {
          'fullName': fullName,
          'email': email,
          'add': address,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Get.to(() => const SignInScreen());
      } else {
        Get.snackbar('Error', 'Sign up failed',
            colorText: Colors.white, backgroundColor: primaryColor);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: primaryColor, colorText: Colors.white);
    }
  }
}
