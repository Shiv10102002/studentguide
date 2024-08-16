import 'package:dio/dio.dart' as _dio;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/provider/api_provider.dart';
import 'package:studentguide/view/auth/sign_in_screen.dart';

class ParentSignUpController extends GetxController {
  late ApiProvider _apiProvider;
  Rx<TextEditingController> namecontroller = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> addController = TextEditingController().obs;
  Rx<TextEditingController> passsController = TextEditingController().obs;
  final _obscureText = true.obs;
  bool get obscureText => _obscureText.value;

  final _baseUrl = 'https://1cc3-106-77-180-74.ngrok-free.app/';

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _apiProvider = Get.find<ApiProvider>();
  }

  void toggleObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  String getBaseURL(String endpoint) {
    debugPrint("${_baseUrl + endpoint}");
    return _baseUrl + endpoint;
  }

  // Future<void> signUp() async {
  //   String name = namecontroller.value.text;
  //   String email = emailController.value.text;
  //   String address = addController.value.text;
  //   String password = passsController.value.text;

  //   debugPrint(name);
  //   debugPrint(email);
  //   debugPrint(address);
  //   debugPrint(password);

  //   isLoading.value = true;
  //   try {
  //     final dio = _dio.Dio();
  //     final formData = _dio.FormData.fromMap({
  //       'name': name,
  //       'email': email,
  //       'address': address,
  //       'password': password,
  //     });

  //     final response = await dio.post(
  //       getBaseURL('addparent'),
  //       data: formData,
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Get.to(() => const SignInScreen());
  //     } else {
  //       Get.snackbar('Error', 'Sign up failed',
  //           colorText: Colors.white, backgroundColor: primaryColor);
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'An error occurred: $e',
  //         backgroundColor: primaryColor, colorText: Colors.white);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> signUp() async {
    final fullName = namecontroller.value.text;
    final email = emailController.value.text;
    final address = addController.value.text;
    final password = passsController.value.text;

    debugPrint(fullName);
    debugPrint(email);
    debugPrint(address);
    debugPrint(password);

    isLoading.value = true;
    try {
      await _apiProvider.RegisterParent(
          onSuccess: (res) {
            Get.to(() => const SignInScreen());
          },
          onError: (err) {
            throw Exception(err);
          },
          reqData: {
            "email": email,
            "name": fullName,
            "address": address,
            "password": password
          });
    } catch (e) {
      debugPrint("error occour during sign up ${e}");
    } finally {
      isLoading.value = false;
    }
  }
}
