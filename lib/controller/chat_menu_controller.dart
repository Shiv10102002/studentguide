import 'package:get/get.dart';

class ChatMenuController extends GetxController {
  void onMenuSelected(String value) {
    switch (value) {
      case 'Create Group':
        // Handle create group action
        Get.snackbar('Action', 'Create Group selected');
        break;
      case 'Find Teacher':
        // Handle find teacher action
        Get.snackbar('Action', 'Find Teacher selected');
        break;
      case 'Find Friend':
        // Handle find friend action
        Get.snackbar('Action', 'Find Friend selected');
        break;
      case 'Settings':
        // Handle settings action
        Get.snackbar('Action', 'Settings selected');
        break;
    }
  }
}
