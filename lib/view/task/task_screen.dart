import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/task_controller.dart'; // Adjust the import according to your folder structure
import 'package:intl/intl.dart';
import 'package:studentguide/view/task/components/custom_tab_controller.dart';
import 'package:studentguide/view/task/components/date_card.dart';
import 'package:studentguide/view/task/components/month_year_pickup_dialog.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  final TaskController taskController = Get.find<TaskController>();
  final ScrollController scrollController = ScrollController();

  void _centerSelectedDate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index =
          DateTime.now().difference(taskController.selectedDate.value).inDays +
              30;
      double position =
          index * 58.0; // 58 is an estimate of the width of each date tile
      double screenWidth = Get.context!.size!.width;
      double centerPosition = position -
          screenWidth / 2 +
          29.0; // 29 is half of the estimated tile width
      scrollController.jumpTo(centerPosition);
    });
  }

  final TaskController controller = Get.put(TaskController());
//   @override
//   Widget build(BuildContext context) {
//     _centerSelectedDate();

//     return Scaffold(
//         floatingActionButton: InkWell(
//           onTap: () {
//             Get.bottomSheet(
//               backgroundColor: primaryColor,
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: controller.formKey,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           controller: controller.titleController,
//                           decoration: const InputDecoration(labelText: 'title'),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a title';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: defaultPadding,
//                         ),
//                         TextFormField(
//                           controller: controller.descriptionController,
//                           decoration:
//                               const InputDecoration(labelText: 'Description'),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a description';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: defaultPadding,
//                         ),
//                         TextFormField(
//                           controller: controller.taskDateController,
//                           decoration:
//                               const InputDecoration(labelText: 'Task Date'),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a task date';
//                             }
//                             return null;
//                           },
//                           onTap: () async {
//                             DateTime? pickedDate = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(2000),
//                               lastDate: DateTime(2101),
//                             );
//                             if (pickedDate != null) {
//                               controller.taskDateController.text =
//                                   DateFormat('yyyy-MM-dd').format(pickedDate);
//                             }
//                           },
//                         ),
//                         const SizedBox(
//                           height: defaultPadding,
//                         ),
//                         TextFormField(
//                           controller: controller.taskTimeController,
//                           decoration:
//                               const InputDecoration(labelText: 'Task Time'),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a task time';
//                             }
//                             return null;
//                           },
//                           onTap: () async {
//                             TimeOfDay? pickedTime = await showTimePicker(
//                               context: context,
//                               initialTime: TimeOfDay.now(),
//                             );
//                             if (pickedTime != null) {
//                               final now = DateTime.now();
//                               final dateTime = DateTime(now.year, now.month,
//                                   now.day, pickedTime.hour, pickedTime.minute);
//                               controller.taskTimeController.text =
//                                   DateFormat('HH:mm').format(dateTime);
//                             }
//                           },
//                         ),
//                         // Obx(() {
//                         //   return DropdownButtonFormField<String>(
//                         //     value: controller.selectedTaskStatus.value,
//                         //     onChanged: (value) {
//                         //       if (value != null) {
//                         //         controller.SetSelectedStatus(value);
//                         //       }
//                         //     },
//                         //     items: controller.Status.map(e) {
//                         //       return DropdownMenuItem(
//                         //         value: (index + 1).toString(),
//                         //         child: Text(
//                         //           '$e',
//                         //           style: const TextStyle(
//                         //               color:
//                         //                   Color.fromARGB(255, 123, 122, 122)),
//                         //         ),
//                         //       );
//                         //     },
//                         //     decoration: const InputDecoration(
//                         //       hintText: "Status",
//                         //       hintStyle: TextStyle(
//                         //           color: Color.fromARGB(255, 208, 207, 207)),
//                         //     ),
//                         //   );
//                         // }),

//                         const SizedBox(
//                           height: defaultPadding,
//                         ),

//                         Obx(() {
//                           return DropdownButtonFormField<String>(
//                             value: controller.selectedTaskStatus
//                                 .value, // This should match one of the items or be null
//                             onChanged: (value) {
//                               if (value != null) {
//                                 controller.setSelectedStatus(value);
//                               }
//                             },
//                             items: controller.Status.map((e) {
//                               return DropdownMenuItem(
//                                 value:
//                                     e, // Ensure this matches the type and value in selectedTaskStatus
//                                 child: Text(
//                                   e,
//                                   style: const TextStyle(
//                                     color: Color.fromARGB(255, 123, 122, 122),
//                                   ),
//                                 ),
//                               );
//                             }).toList(), // Convert map to a list
//                             decoration: const InputDecoration(
//                               hintText: "Status",
//                               hintStyle: TextStyle(
//                                 color: Color.fromARGB(255, 208, 207, 207),
//                               ),
//                             ),
//                           );
//                         }),

//                         const SizedBox(
//                           height: defaultPadding,
//                         ),
//                         TextFormField(
//                           controller: controller.completionDateController,
//                           decoration: const InputDecoration(
//                               labelText: 'Completion Date'),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a completion date';
//                             }
//                             return null;
//                           },
//                           onTap: () async {
//                             DateTime? pickedDate = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(2000),
//                               lastDate: DateTime(2101),
//                             );
//                             if (pickedDate != null) {
//                               controller.completionDateController.text =
//                                   DateFormat('yyyy-MM-dd').format(pickedDate);
//                             }
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: controller.addTask,
//                           child: const Text(
//                             'Add Task',
//                             style: TextStyle(color: primaryColor),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               isScrollControlled: true,
//             );
//           },
//           child: Container(
//             decoration: BoxDecoration(
//                 color: primaryColor, borderRadius: BorderRadius.circular(5)),
//             child: const Padding(
//               padding: EdgeInsets.all(12),
//               child: Text(
//                 "Add Task",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//         appBar: AppBar(
//           title: Text(
//             "Task Screen",
//             style: darksemibold16.copyWith(fontSize: 18),
//             textScaler: TextScaler.noScaling,
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 140,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Obx(() => Text(
//                                   months[
//                                       taskController.selectedMonth.value - 1],
//                                   style: darksemibold16,
//                                 )),
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 size: defaultPadding,
//                               ),
//                               onPressed: () {
//                                 _showMonthYearPicker(context);
//                               },
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.arrow_back_ios,
//                                 size: defaultPadding,
//                               ),
//                               onPressed: () {
//                                 controller.decrementMonth();
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.arrow_forward_ios,
//                                 size: defaultPadding,
//                               ),
//                               onPressed: () {
//                                 controller.incrementMonth();
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                         child: ListView.builder(
//                       controller: scrollController,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 61, // 20 days before and 20 days after
//                       itemBuilder: (context, index) {
//                         DateTime date =
//                             DateTime.now().subtract(Duration(days: 30 - index));
//                         bool isSelected = date.day ==
//                                 controller.selectedDate.value.day &&
//                             date.month == controller.selectedDate.value.month &&
//                             date.year == controller.selectedDate.value.year;
//                         bool isBeforeToday = date.isBefore(DateTime.now());
//                         return GestureDetector(
//                             onTap: () {
//                               controller.updateSelectedDate(date);
//                             },
//                             child: DateCard(
//                                 date: date,
//                                 controller: controller,
//                                 isBeforeToday: isBeforeToday,
//                                 weekdays: weekdays,
//                                 isSelected: isSelected));
//                       },
//                     )),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: defaultPadding,
//               ),
//               CustomTabBar(controller: controller.tabController, tabs: const [
//                 Tab(
//                   text: 'Ongoing',
//                   iconMargin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
//                 ),
//                 Tab(text: 'Complete'),
//                 Tab(text: 'Due'),
//               ]),
//               Expanded(
//                   child: TabBarView(
//                       controller: controller.tabController,
//                       children: [
//                     Obx(
//                       () => Column(
//                           children: controller.taskList.map((e) {
//                         return e.status == 'ongoing'
//                             ? Container(
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       e.title,
//                                       style: darksemibold16,
//                                       textScaler: TextScaler.noScaling,
//                                     ),
//                                     SizedBox(
//                                       height: defaultPadding,
//                                     ),
//                                     Text(
//                                       e.description,
//                                       style: darksemibold16,
//                                       textScaler: TextScaler.noScaling,
//                                     ),
//                                     SizedBox(
//                                       height: defaultPadding,
//                                     ),
//                                     Text(
//                                       e.status,
//                                       style: darksemibold16,
//                                       textScaler: TextScaler.noScaling,
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : SizedBox();
//                       }).toList()),
//                     ),
//                     Center(child: Text('completed')),
//                     Center(child: Text('due')),
//                   ]))
//             ],
//           ),
//         )

//         // TabBarView(
//         //   controller: controller.tabController,
//         //   children: const [
//         //     Center(child: Text('new')),
//         //     Center(child: Text('ongoing')),
//         //     Center(child: Text('completed')),
//         //     Center(child: Text('due')),
//         //   ],
//         // ),
//         );
//   }

//   void _showMonthYearPicker(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return MontYearPickupDialog(
//             controller: taskController, years: years, months: months);
//       },
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    _centerSelectedDate();

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
                        decoration: const InputDecoration(labelText: 'Title'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: defaultPadding),
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
                      const SizedBox(height: defaultPadding),
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
                      const SizedBox(height: defaultPadding),
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
                      const SizedBox(height: defaultPadding),
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          value: controller.selectedTaskStatus.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.setSelectedStatus(value);
                            }
                          },
                          items: controller.Status.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 123, 122, 122),
                                ),
                              ),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            hintText: "Status",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 208, 207, 207),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: defaultPadding),
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
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
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
        title: Text(
          "Task Screen",
          style: darksemibold16.copyWith(fontSize: 18),
          textScaler: TextScaler.noScaling,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Text(
                                months[taskController.selectedMonth.value - 1],
                                style: darksemibold16,
                              )),
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: defaultPadding,
                            ),
                            onPressed: () {
                              _showMonthYearPicker(context);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: defaultPadding,
                            ),
                            onPressed: () {
                              controller.decrementMonth();
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: defaultPadding,
                            ),
                            onPressed: () {
                              controller.incrementMonth();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 61, // 20 days before and 20 days after
                      itemBuilder: (context, index) {
                        DateTime date =
                            DateTime.now().subtract(Duration(days: 30 - index));
                        bool isSelected = date.day ==
                                controller.selectedDate.value.day &&
                            date.month == controller.selectedDate.value.month &&
                            date.year == controller.selectedDate.value.year;
                        bool isBeforeToday = date.isBefore(DateTime.now());
                        return GestureDetector(
                          onTap: () {
                            controller.updateSelectedDate(date);
                          },
                          child: DateCard(
                            date: date,
                            controller: controller,
                            isBeforeToday: isBeforeToday,
                            weekdays: weekdays,
                            isSelected: isSelected,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            CustomTabBar(controller: controller.tabController, tabs: const [
              Tab(
                text: 'Ongoing',
                iconMargin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              ),
              Tab(text: 'Complete'),
              Tab(text: 'Due'),
            ]),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  // Ongoing Tasks
                  Obx(() {
                    var ongoingTasks = controller.taskList
                        .where((task) => task.status == 'ongoing')
                        .toList();
                    return ListView.builder(
                      itemCount: ongoingTasks.length,
                      itemBuilder: (context, index) {
                        var task = ongoingTasks[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: defaultPadding),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            tileColor: secondaryColor,
                            title: Text(task.title, style: darksemibold16),
                            subtitle: Text(task.description),
                            trailing: Text(task.status),
                          ),
                        );
                      },
                    );
                  }),
                  // Completed Tasks

                  Obx(() {
                    var completedTasks = controller.taskList
                        .where((task) => task.status == 'completed')
                        .toList();
                    return ListView.builder(
                      itemCount: completedTasks.length,
                      itemBuilder: (context, index) {
                        var task = completedTasks[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: defaultPadding),
                          child: ListTile(
                            tileColor: textaccentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            title: Text(task.title, style: darksemibold16),
                            subtitle: Text(task.description),
                            trailing: Text(task.status),
                          ),
                        );
                      },
                    );
                  }),
                  // Due Tasks
                  Obx(() {
                    var dueTasks = controller.taskList
                        .where((task) => task.status == 'pending')
                        .toList();
                    return ListView.builder(
                      itemCount: dueTasks.length,
                      itemBuilder: (context, index) {
                        var task = dueTasks[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: defaultPadding),
                          child: ListTile(
                            tileColor: accentColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            title: Text(
                              task.title,
                              style: whitenormal16,
                              textScaler: TextScaler.noScaling,
                            ),
                            subtitle: Text(
                              task.description,
                              style: whitenormal14,
                              textScaler: TextScaler.noScaling,
                            ),
                            trailing: Text(
                              task.status,
                              style: whitenormal14,
                              textScaler: TextScaler.noScaling,
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMonthYearPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MontYearPickupDialog(
            controller: taskController, years: years, months: months);
      },
    );
  }
}
