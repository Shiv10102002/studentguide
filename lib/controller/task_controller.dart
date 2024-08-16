import 'dart:math';
import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:studentguide/provider/api_provider.dart';

class Task {
  int id;
  String title;
  String description;
  DateTime taskDate;
  String taskTime;
  DateTime taskDeadline;
  String status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.taskDate,
    required this.taskTime,
    required this.taskDeadline,
    required this.status,
  });

  // Factory method to create a Task object from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['task_name'],
      description: json['description'] ?? '',
      taskDate: DateTime.parse(json['task_date']),
      taskTime: json['task_time'],
      taskDeadline: DateTime.parse(json['task_deadline']),
      status: json['status'],
    );
  }
}

class TaskController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var selectedDate = DateTime.now().obs;
  var selectedMonth = DateTime.now().month.obs;
  var selectedYear = DateTime.now().year.obs;

  var selectedDateAppBBar = DateTime.now().obs;
  var selectedDateNotAppBBar = DateTime.now().obs;

  late TabController tabController;

  late ApiProvider _apiProvider;

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
    tabController = TabController(length: 3, vsync: this);
    _apiProvider = Get.find<ApiProvider>();
    getAllTask();
    super.onInit();
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  var selectedTaskStatus =
      RxnString(); // Initialize with null to avoid the initial mismatch
  final List<String> Status = ['complete', 'ongoing', 'pending'];

  void setSelectedStatus(String status) {
    selectedTaskStatus.value = status;
  }

  void incrementMonth() {
    if (selectedMonth.value == 12) {
      selectedMonth.value = 1;
      selectedYear.value++;
    } else {
      selectedMonth.value++;
    }
  }

  void decrementMonth() {
    if (selectedMonth.value == 1) {
      selectedMonth.value = 12;
      selectedYear.value--;
    } else {
      selectedMonth.value--;
    }
  }

  void selectMonthYear(int month, int year) {
    selectedMonth.value = month;
    selectedYear.value = year;
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

  // List to hold all tasks
  var taskList = <Task>[].obs;

  Future<void> getAllTask() async {
    try {
      // Replace with the appropriate email
      final response = await _apiProvider.getAllTask(onSuccess: (response) {
        if (response != null && response is List) {
          taskList.value =
              response.map((taskData) => Task.fromJson(taskData)).toList();
          debugPrint(
              'Tasks fetched successfully: ${taskList.length} tasks found.');
        } else {
          debugPrint('Failed to fetch tasks: Invalid response.');
        }
      }, onError: (error) {
        debugPrint('Error creating task: $error');
      });
    } catch (e) {
      debugPrint('Error fetching tasks: $e');
    }
  }

  void addTask() async {
    if (formKey.currentState!.validate()) {
      // Add task logic
      String title = titleController.text;
      String description = descriptionController.text;
      DateTime taskDate =
          DateFormat('yyyy-MM-dd').parse(taskDateController.text);
      DateTime taskTime = DateFormat('HH:mm').parse(taskTimeController.text);
      DateTime completionDate =
          DateFormat('yyyy-MM-dd').parse(completionDateController.text);

      // Extract the time part from taskTime
      String formattedTaskTime = DateFormat('HH:mm').format(taskTime);
      String fomatedTaskDate = DateFormat('yyyy-MM-dd').format(taskDate);
      String fomatedCompletionDate =
          DateFormat('yyyy-MM-dd').format(completionDate);

      debugPrint(title);
      debugPrint(description);

      debugPrint(fomatedCompletionDate.toString());
      debugPrint(formattedTaskTime);

      await _apiProvider.addTask(
        taskName: titleController.value.text,
        taskDate: fomatedTaskDate,
        taskTime: formattedTaskTime,
        taskDeadline: fomatedCompletionDate,
        taskStatus: selectedTaskStatus.value!,
        taskDesc: descriptionController.value.text,
        onSuccess: (response) {
          debugPrint(response);
          debugPrint('Task created successfully: $response');

          Get.snackbar("Task Added", "Task Added successfully");
          getAllTask();
        },
        onError: (error) {
          // Handle error
          debugPrint('Error creating task: $error');
        },
      );

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
