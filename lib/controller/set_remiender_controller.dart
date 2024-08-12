import 'dart:math';
import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Remiender {
  String title;
  String description;
  DateTime remDate;
  DateTime remTime;
  String status;

  Remiender({
    required this.title,
    required this.description,
    required this.remDate,
    required this.remTime,
    this.status = 'New',
  });
}

class SetRemienderController extends GetxController
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
  final TextEditingController remDateController = TextEditingController();
  final TextEditingController remTimeController = TextEditingController();

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
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

  void setRemiender() {
    if (formKey.currentState!.validate()) {
      // Add task logic
      String title = titleController.text;
      String description = descriptionController.text;
      DateTime remkDate =
          DateFormat('yyyy-MM-dd').parse(remDateController.text);
      DateTime remTime = DateFormat('HH:mm').parse(remTimeController.text);

      Remiender newRem = Remiender(
        title: title,
        description: description,
        remTime: remTime,
        remDate: remkDate,
      );

      // Assuming you have a list to add the remiender to
      // remienders.add(newRem);

      // Clear the form
      titleController.clear();
      descriptionController.clear();
      remDateController.clear();
      remTimeController.clear();

      Get.back(); // Close the bottom sheet
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    remDateController.dispose();
    remTimeController.dispose();

    super.onClose();
  }
}
