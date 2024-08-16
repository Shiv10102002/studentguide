import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentguide/prefutils.dart';
import 'package:studentguide/provider/api_provider.dart';
import 'package:studentguide/view/summerize_story/summerize_result_screen.dart';

class SummerizeController extends GetxController {
  final Rx<File?> _selectedImage = Rx<File?>(null);
  File? get selectedImage => _selectedImage.value;

  late ApiProvider _apiProvider;

  List<Map<String, dynamic>> allsummary = [];

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedImage.value = File(pickedFile.path);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _apiProvider = Get.find<ApiProvider>();

    allsummary = Get.find<PrefUtils>().getSummaryList();
  }

  Future<void> getSummery() async {
    debugPrint("get summary method called from summarize controller");

    try {
      await _apiProvider.getSummery(
        onSuccess: (res) {
          debugPrint("Summary received: ${res["summary"]}");

          Get.find<PrefUtils>()
              .addSummaryAndImagePath(res["summary"], selectedImage!);

          // Navigate to the result screen
          Get.back();
          Get.to(() => SummerizeResultScreen(
                summery: res["summary"],
                assests: selectedImage!,
              ));
        },
        onError: (error) {
          debugPrint("Error received: $error");
          Get.snackbar('Error', error,
              backgroundColor: Colors.red, colorText: Colors.white);
        },
        imagePath: selectedImage!.path,
      );
    } catch (e) {
      debugPrint("An error occurred in getSummery method: $e");
      Get.snackbar('Error', 'An unexpected error occurred: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _selectedImage.value = null;
    super.dispose();
  }
}
