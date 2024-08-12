// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/controller/auth_controller.dart';
import 'package:studentguide/view/home/home_screen.dart';
// import 'home_screen.dart';

class SignInController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final _obscureText = true.obs; // Added this line

  // final Dio _dio = Dio();
  final AuthController authController = Get.find<AuthController>();
  GlobalKey<FormState> get formKey => _formKey;

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar("Error", "Please fill in all fields");
        return;
      }

      isLoading.value = true;
      // try {
      //   final response = await _dio.post('https://testapi/user/signin', data: {
      //     'email': email,
      //     'password': password,
      //   });

      //   if (response.statusCode == 200) {
      //     // Assuming response data contains user information or token
      //     final data = response.data;

      //     // Store token or user information in GetStorage
      //     GetStorage().write('user', data);

      //     // Navigate to HomeScreen
      //     Get.offAll(() => const HomeScreen());
      //   } else {
      //     Get.snackbar("Error", "Sign in failed");
      //   }
      // } catch (e) {
      //   Get.snackbar("Error", "Sign in failed: ${e.toString()}");
      // } finally {
      //   isLoading.value = false;
      // }
// temporary auth
      try {
        // Simulate API call
        await Future.delayed(const Duration(seconds: 2));
        final data = {
          'email': email,
          'token': 'dummyToken',
        };

        // On successful login
        authController.login(data);

        // Navigate to HomeScreen
        Get.offAll(() => const HomeScreen());
      } catch (e) {
        Get.snackbar("Error", "Sign in failed: ${e.toString()}");
      } finally {
        isLoading.value = false;
      }

    
    }
  }

  void toggleObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  bool get obscureText => _obscureText.value; // Getter for _obscureText
  @override
  void onClose() {
    emailController.dispose();

    passwordController.dispose();

    super.onClose();
  }
}
