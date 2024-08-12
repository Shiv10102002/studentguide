import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendSearchController extends GetxController {
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController friendNameController = TextEditingController();
  var selectedClass = 'Class 1'.obs;
  var selectedSubject = 'Math'.obs;

  List<String> classes =
      List<String>.generate(12, (index) => 'Class ${index + 1}');
 

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setSelectedClass(String value) {
    selectedClass.value = value;
  }

  void setSelectedSubject(String value) {
    selectedSubject.value = value;
  }

  void performSearch() {
    if (formKey.currentState!.validate()) {
      // Implement your search logic here
      debugPrint('Searching for:');
      debugPrint('School Name: ${schoolNameController.text}');
      debugPrint('Teacher Name: ${friendNameController.text}');
      debugPrint('Class: ${selectedClass.value}');
      debugPrint('Subject: ${selectedSubject.value}');
    }
  }

  @override
  void onClose() {
    schoolNameController.dispose();
    friendNameController.dispose();
    super.onClose();
  }
}
