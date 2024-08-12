import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/view/home/home_screen.dart';
// Make sure to import your home page

class SignUpController extends GetxController {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController collegeNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _obscureText = true.obs;
  final _selectedClass = '1'.obs;

  GlobalKey<FormState> get formKey => _formKey;
  bool get obscureText => _obscureText.value;
  String get selectedClass => _selectedClass.value;

  void toggleObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  void setSelectedClass(String value) {
    _selectedClass.value = value;
  }

  Future<void> signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final fullName = fullNameController.text;
      final email = emailController.text;
      final collegeName = collegeNameController.text;
      final classSelected = selectedClass;
      final password = passwordController.text;

      try {
        final dio = Dio();
        final response = await dio.post(
          'https://testapi/user/signup',
          data: {
            'fullName': fullName,
            'email': email,
            'collegeName': collegeName,
            'class': classSelected,
            'password': password,
          },
        );

        if (response.statusCode == 200) {
          Get.to(() => const HomeScreen());
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

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    collegeNameController.dispose();
    classController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
