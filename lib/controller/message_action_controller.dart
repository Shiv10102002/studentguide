import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageActionsController extends GetxController {
  RxBool showActions = false.obs;

  TextEditingController messageController = TextEditingController();

  void toggleActions(bool show) {
    showActions.value = show;
  }

  void copyMessage() {
    Get.snackbar('Message', 'Copied successfully');
    toggleActions(false);
  }

  void deleteMessage() {
    Get.snackbar('Message', 'Deleted successfully');
    toggleActions(false);
  }
}
