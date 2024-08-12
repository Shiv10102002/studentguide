import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherSearchController extends GetxController {
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController teacherNameController = TextEditingController();
  var selectedClass = 'Class 1'.obs;
  var selectedSubject = 'Math'.obs;

  List<String> classes =
      List<String>.generate(12, (index) => 'Class ${index + 1}');
  List<String> subjects = [
    'Math',
    'Physics',
    'Chemistry',
    'History',
    'Biology',
    'Hindi',
    'English'
  ];

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
      debugPrint('Teacher Name: ${teacherNameController.text}');
      debugPrint('Class: ${selectedClass.value}');
      debugPrint('Subject: ${selectedSubject.value}');
    }
  }

  @override
  void onClose() {
    schoolNameController.dispose();
    teacherNameController.dispose();
    super.onClose();
  }
}
