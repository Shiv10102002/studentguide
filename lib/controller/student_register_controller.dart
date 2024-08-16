// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:studentguide/constant.dart';
// import 'package:studentguide/view/home/home_screen.dart';
// // Make sure to import your home page

// class StudentRegisterController extends GetxController {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController collegeNameController = TextEditingController();
//   final TextEditingController classController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController fatherNameController = TextEditingController();

//   final TextEditingController schoolId = TextEditingController();
//   final TextEditingController address = TextEditingController();

//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   final _obscureText = true.obs;
//   final _selectedClass = '1'.obs;

//   GlobalKey<FormState> get formKey => _formKey;
//   bool get obscureText => _obscureText.value;
//   String get selectedClass => _selectedClass.value;

//   void toggleObscureText() {
//     _obscureText.value = !_obscureText.value;
//   }

//   void setSelectedClass(String value) {
//     _selectedClass.value = value;
//   }

//   Future<void> signUp() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       final fullName = fullNameController.text;
//       final email = emailController.text;
//       final collegeName = collegeNameController.text;
//       final classSelected = selectedClass;
//       final password = passwordController.text;

//       try {
//         final dio = Dio();
//         final response = await dio.post(
//           'https://testapi/user/signup',
//           data: {
//             'fullName': fullName,
//             'email': email,
//             'collegeName': collegeName,
//             'class': classSelected,
//             'password': password,
//           },
//         );

//         if (response.statusCode == 200) {
//           Get.to(() => const HomeScreen());
//         } else {
//           Get.snackbar('Error', 'Sign up failed',
//               colorText: Colors.white, backgroundColor: primaryColor);
//         }
//       } catch (e) {
//         Get.snackbar('Error', 'An error occurred: $e',
//             backgroundColor: primaryColor, colorText: Colors.white);
//       }
//     }
//   }

//   @override
//   void onClose() {
//     fullNameController.dispose();
//     emailController.dispose();
//     collegeNameController.dispose();
//     classController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.onClose();
//   }
// }

import 'dart:io';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:image_picker/image_picker.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/provider/api_provider.dart';
import 'package:studentguide/view/ParentView/parent_main_screen.dart';
import 'package:studentguide/view/home/home_screen.dart';

class StudentRegisterController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  late ApiProvider _apiProvider;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController collegeNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController schoolName = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _obscureText = true.obs;
  final _selectedClass = '1'.obs;
  final Rx<File?> _selectedImage = Rx<File?>(null);

  GlobalKey<FormState> get formKey => _formKey;
  bool get obscureText => _obscureText.value;
  String get selectedClass => _selectedClass.value;
  File? get selectedImage => _selectedImage.value;

  @override
  void onInit() {
    super.onInit();
    _apiProvider = Get.find<ApiProvider>();
  }

  void toggleObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  void setSelectedClass(String value) {
    _selectedClass.value = value;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedImage.value = File(pickedFile.path);
    }
  }

  // Rx<PlatformFile> idcard = PlatformFile(name: '', size: 0).obs;

  Future<void> registerStudent() async {
    if (_selectedImage.value == null) {
      Get.snackbar('Error', 'Please select an image',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    debugPrint(fullNameController.text + " " + passwordController.text);
    debugPrint(fatherNameController.text + " " + collegeNameController.text);

    debugPrint(address.text + " " + selectedClass);
    debugPrint(emailController.text + " " + selectedImage!.path);

    await _apiProvider.RegisterStudent(
      name: fullNameController.text,
      password: passwordController.text,
      fatherName: fatherNameController.text,
      schoolName: collegeNameController.text,
      address: address.text,
      className: selectedClass,
      imagePath: _selectedImage.value!.path,
      email: emailController.text,
      onSuccess: (response) {
        Get.snackbar('Success', 'Student registered successfully',
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.to(() => ParentMainScreen());
      },
      onError: (error) {
        Get.snackbar('Error', error,
            backgroundColor: Colors.red, colorText: Colors.white);
      },
    );
  }

  // pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);
  //   if (result != null) {
  //     PlatformFile file = result.files.first;
  //     idcard.value = file;
  //   }
  // }

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
