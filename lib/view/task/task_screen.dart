import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/task_controller.dart'; // Adjust the import according to your folder structure
import 'package:intl/intl.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.put(TaskController());

    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Get.bottomSheet(
            backgroundColor: primaryColor,
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.titleController,
                        decoration: const InputDecoration(labelText: 'title'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      TextFormField(
                        controller: controller.descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      TextFormField(
                        controller: controller.taskDateController,
                        decoration:
                            const InputDecoration(labelText: 'Task Date'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a task date';
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            controller.taskDateController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          }
                        },
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      TextFormField(
                        controller: controller.taskTimeController,
                        decoration:
                            const InputDecoration(labelText: 'Task Time'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a task time';
                          }
                          return null;
                        },
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            final now = DateTime.now();
                            final dateTime = DateTime(now.year, now.month,
                                now.day, pickedTime.hour, pickedTime.minute);
                            controller.taskTimeController.text =
                                DateFormat('HH:mm').format(dateTime);
                          }
                        },
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      TextFormField(
                        controller: controller.completionDateController,
                        decoration:
                            const InputDecoration(labelText: 'Completion Date'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a completion date';
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            controller.completionDateController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: controller.addTask,
                        child: const Text(
                          'Add Task',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isScrollControlled: true,
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30)),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Add Task",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                controller.formatYear(controller.selectedDateAppBBar.value),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Obx(
              () => Text(
                controller
                    .formatDateAndMonth(controller.selectedDateAppBBar.value),
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              controller.goToTodaySecondController();
            },
            child: Text(
              "Go to today",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: CalendarSlider(
                  fullCalendar: false,
                  controller: controller.secondController,
                  selectedDayPosition: SelectedDayPosition.center,
                  locale: 'en',
                  selectedDateColor: Colors.white,
                  selectedTileBackgroundColor: primaryColor,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                  events: List.generate(
                    100,
                    (index) => DateTime.now().subtract(
                      Duration(days: index * controller.random.nextInt(5)),
                    ),
                  ),
                  onDateSelected: (date) {
                    controller.updateSelectedDateAppBBar(date);
                  },
                ),
              ),
              TabBar(
                dividerHeight: 0,
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                splashBorderRadius: BorderRadius.circular(20),
                labelColor: primaryColor,
                indicatorColor: primaryColor,
                unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                controller: controller.tabController,
                onTap: (index) => controller.changeIndex(index),
                tabs: const [
                  Tab(
                    text: 'new',
                  ),
                  Tab(text: 'Ongoing'),
                  Tab(text: 'complete'),
                  Tab(text: 'due'),
                ],
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          Center(child: Text('new')),
          Center(child: Text('ongoing')),
          Center(child: Text('completed')),
          Center(child: Text('due')),
        ],
      ),
    );
  }
}
