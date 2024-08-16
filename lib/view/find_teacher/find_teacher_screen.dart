import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:studentguide/components/buttons/primary_button.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/teacher_search_controller.dart';

class FindTeacherSCreen extends StatelessWidget {
  FindTeacherSCreen({super.key});
  final TeacherSearchController searchController =
      Get.put(TeacherSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("find teacher"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: searchController.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: searchController.schoolNameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'School Name'),
                  validator:
                      RequiredValidator(errorText: "School Name is required")
                          .call,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: searchController.teacherNameController,
                  decoration: const InputDecoration(labelText: 'Teacher Name'),
                  validator:
                      RequiredValidator(errorText: "Teacher Name is required")
                          .call,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => Container(
                    height: 51,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [],
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        hint:
                            Text('Select your Class'.tr, style: lightnormal14),
                        value: (searchController.selectedClass.value.isEmpty)
                            ? null
                            : searchController.selectedClass.value,
                        iconStyleData: const IconStyleData(
                          icon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),
                          iconSize: 26,
                          iconEnabledColor: bodyTextColor,
                          iconDisabledColor: bodyTextColor,
                        ),
                        items: searchController.classes.map((classname) {
                          return DropdownMenuItem(
                            value: classname.toString(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(classname, style: darknormal14),
                            ),
                          );
                        }).toList(),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 220,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 0.1, color: bodyTextColor),
                            color: Colors.white,
                          ),
                          offset: const Offset(-20, -5),
                          elevation: 0,
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 13),
                        ),
                        onChanged: (String? newValue) {
                          searchController.selectedClass.value = newValue!;
                        },
                      ),
                    ),
                  ),
                ),
                // Obx(() => DropdownButtonFormField<String>(
                //       dropdownColor: primaryColor,
                //       decoration: InputDecoration(
                //         hintText: 'Class',
                //         hintStyle: Theme.of(context).textTheme.bodyLarge,
                //       ),
                //       value: searchController.selectedClass.value,
                //       items: searchController.classes
                //           .map((classItem) => DropdownMenuItem(
                //                 value: classItem,
                //                 child: Text(
                //                   classItem,
                //                   style: Theme.of(context).textTheme.bodyLarge,
                //                 ),
                //               ))
                //           .toList(),
                //       onChanged: (value) {
                //         searchController.setSelectedClass(value!);
                //       },
                //       validator: (value) =>
                //           value == null ? "Class is required" : null,
                //     )),
                const SizedBox(height: 16),
                Obx(
                  () => Container(
                    height: 51,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [],
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        hint: Text('Select your Subject'.tr,
                            style: lightnormal14),
                        value: (searchController.selectedSubject.value.isEmpty)
                            ? null
                            : searchController.selectedSubject.value,
                        iconStyleData: const IconStyleData(
                          icon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),
                          iconSize: 26,
                          iconEnabledColor: bodyTextColor,
                          iconDisabledColor: bodyTextColor,
                        ),
                        items: searchController.subjects.map((sub) {
                          return DropdownMenuItem(
                            value: sub.toString(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(sub, style: darknormal14),
                            ),
                          );
                        }).toList(),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 220,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 0.1, color: bodyTextColor),
                            color: Colors.white,
                          ),
                          offset: const Offset(-20, -5),
                          elevation: 0,
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 13),
                        ),
                        onChanged: (String? newValue) {
                          searchController.selectedSubject.value = newValue!;
                        },
                      ),
                    ),
                  ),
                ),

                // Obx(() => DropdownButtonFormField<String>(
                //       dropdownColor: secondaryColor,

                //       decoration: const InputDecoration(
                //           hintText: 'Subject',
                //           hintStyle: TextStyle(
                //               color: Color.fromARGB(255, 208, 207, 207))),
                //       value: searchController.selectedSubject.value,
                //       items: searchController.subjects
                //           .map((subject) => DropdownMenuItem(
                //                 value: subject,
                //                 child: Text(
                //                   subject,
                //                   style: Theme.of(context).textTheme.bodyLarge,
                //                 ),
                //               ))
                //           .toList(),
                //       onChanged: (value) {
                //         searchController.setSelectedSubject(value!);
                //       },
                //       validator: (value) =>
                //           value == null ? "Subject is required" : null,
                //     )),
                const SizedBox(height: 32),
                PrimaryButton(text: 'Search', press: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
