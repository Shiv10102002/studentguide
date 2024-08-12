import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:dio/dio.dart';
import 'package:studentguide/view/auth/reset_email_sent_screen.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final isLoading = false.obs;

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  // final Dio _dio = Dio();

  void sendResetPasswordEmail() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final email = emailController.text.trim();

      if (email.isEmpty) {
        Get.snackbar("Error", "Please enter your email");
        return;
      }

      isLoading.value = true;
      try {
        // final response =
        //     await _dio.post('https://testapi/user/reset-password', data: {
        //   'email': email,
        // });

        // if (response.statusCode == 200) {
        //   Get.to(() => const ResetEmailSentScreen());
        // } else {
        //   Get.snackbar("Error", "Failed to send reset password email");
        // }
        Get.to(() => ResetEmailSentScreen(
              email: email,
            ));
        // emailController.clear();
      } catch (e) {
        Get.snackbar(
            "Error", "Failed to send reset password email: ${e.toString()}");
      } finally {
        isLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();

    super.onClose();
  }
}
