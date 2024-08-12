// import 'dart:math';
// import 'package:calendar_slider/calendar_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class Task {
//   String title;
//   String description;
//   DateTime dueDate;
//   String status;

//   Task({
//     required this.title,
//     required this.description,
//     required this.dueDate,
//     this.status = 'New',
//   });
// }

// class TaskController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   var selectedDateAppBBar = DateTime.now().obs;
//   var selectedDateNotAppBBar = DateTime.now().obs;

//   late TabController tabController;

//   @override
//   void onInit() {
//     tabController = TabController(length: 4, vsync: this);
//     super.onInit();
//   }

//   void changeIndex(int index) {
//     tabController.index = index;
//   }

//   final CalendarSliderController firstController = CalendarSliderController();
//   final CalendarSliderController secondController = CalendarSliderController();

//   final Random random = Random();

//   void updateSelectedDateAppBBar(DateTime date) {
//     selectedDateAppBBar.value = date;
//   }

//   void updateSelectedDateNotAppBBar(DateTime date) {
//     selectedDateNotAppBBar.value = date;
//   }

//   void goToTodayFirstController() {
//     firstController.goToDay(DateTime.now());
//   }

//   void goToTodaySecondController() {
//     secondController.goToDay(DateTime.now());
//   }

//   String formatYear(DateTime date) {
//     return DateFormat('yyyy').format(date);
//   }

//   String formatDateAndMonth(DateTime date) {
//     return DateFormat('MMM dd').format(date);
//   }

//   @override
//   void onClose() {
//     tabController.dispose();
//     super.onClose();
//   }
// }

import 'dart:math';
import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Task {
  String title;
  String description;
  DateTime dueDate;
  String status;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    this.status = 'New',
  });
}

class TaskController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var selectedDateAppBBar = DateTime.now().obs;
  var selectedDateNotAppBBar = DateTime.now().obs;

  late TabController tabController;

  final CalendarSliderController firstController = CalendarSliderController();
  final CalendarSliderController secondController = CalendarSliderController();

  final Random random = Random();

  // Form related controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController taskDateController = TextEditingController();
  final TextEditingController taskTimeController = TextEditingController();
  final TextEditingController completionDateController =
      TextEditingController();

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  void changeIndex(int index) {
    tabController.index = index;
  }

  void updateSelectedDateAppBBar(DateTime date) {
    selectedDateAppBBar.value = date;
  }

  void updateSelectedDateNotAppBBar(DateTime date) {
    selectedDateNotAppBBar.value = date;
  }

  void goToTodayFirstController() {
    firstController.goToDay(DateTime.now());
  }

  void goToTodaySecondController() {
    secondController.goToDay(DateTime.now());
  }

  String formatYear(DateTime date) {
    return DateFormat('yyyy').format(date);
  }

  String formatDateAndMonth(DateTime date) {
    return DateFormat('MMM dd').format(date);
  }

  void addTask() {
    if (formKey.currentState!.validate()) {
      // Add task logic
      String title = titleController.text;
      String description = descriptionController.text;
      DateTime taskDate =
          DateFormat('yyyy-MM-dd').parse(taskDateController.text);
      DateTime taskTime = DateFormat('HH:mm').parse(taskTimeController.text);
      DateTime completionDate =
          DateFormat('yyyy-MM-dd').parse(completionDateController.text);

      Task newTask = Task(
        title: title,
        description: description,
        dueDate: completionDate,
      );

      // Assuming you have a list to add the tasks to
      // tasks.add(newTask);

      // Clear the form
      titleController.clear();
      descriptionController.clear();
      taskDateController.clear();
      taskTimeController.clear();
      completionDateController.clear();

      Get.back(); // Close the bottom sheet
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    taskDateController.dispose();
    taskTimeController.dispose();
    completionDateController.dispose();
    super.onClose();
  }
}
