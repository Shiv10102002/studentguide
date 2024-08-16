// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/auth_controller.dart';
import 'package:studentguide/prefutils.dart';
import 'package:studentguide/provider/api_provider.dart';
import 'package:studentguide/view/ParentView/parent_main_screen.dart';
import 'package:studentguide/view/home/home_screen.dart';
import 'package:studentguide/view/main_screen/main_screen.dart';
// import 'home_screen.dart';

class SignInController extends GetxController {
  final _formKey = GlobalKey<FormState>();

  late ApiProvider _apiProvider;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final _obscureText = true.obs; // Added this line

  // final Dio _dio = Dio();
  // final AuthController authController = Get.find<AuthController>();
  GlobalKey<FormState> get formKey => _formKey;

  final _baseUrl =
      'https://710d-2409-40e4-2050-aa8e-512-e4dd-1f1b-2b72.ngrok-free.app/';

  @override
  void onInit() {
    super.onInit();
    _apiProvider = Get.find<ApiProvider>();
  }

  Future<void> signIn() async {
    final email = emailController.value.text;
    final password = passwordController.value.text;

    debugPrint(email);
    debugPrint(password);

    isLoading.value = true;
    try {
      await _apiProvider.SignIn(
        onSuccess: (res) {
          // Assuming the response contains these fields
          final role = res['role'];
          final name = res['name'];
          final accessToken = res['accessToken'];

          // Store the role, name, email, and access token in shared preferences
          Get.find<PrefUtils>().setRole(role);
          Get.find<PrefUtils>().setUsername(name);
          Get.find<PrefUtils>().setEmailId(email);
          Get.find<PrefUtils>().setToken(accessToken);
          Get.find<PrefUtils>().setLoginStatus(true);

          // Navigate to the appropriate screen based on the role
          if (role == 'parent') {
            Get.to(() => ParentMainScreen());
          } else if (role == 'student') {
            Get.to(() => MainScreen());
          } else if (role == 'teacher') {
            Get.to(() => MainScreen());
          } else {
            // Handle other roles or default case
            Get.snackbar('Error', 'Unknown role: $role',
                colorText: Colors.white, backgroundColor: primaryColor);
          }
        },
        onError: (err) {
          throw Exception(err);
        },
        reqData: {
          "email": email,
          "password": password,
        },
      );
    } catch (e) {
      debugPrint("Error occurred during sign in: ${e}");
      Get.snackbar('Error', 'Sign in failed: ${e.toString()}',
          backgroundColor: primaryColor, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void toggleObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  bool get obscureText => _obscureText.value; // Getter for _obscureText
  @override
  void onClose() {
    // emailController.dispose();

    // passwordController.dispose();

    super.onClose();
  }
}
