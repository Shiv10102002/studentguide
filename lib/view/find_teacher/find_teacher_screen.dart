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
                Obx(() => DropdownButtonFormField<String>(
                      dropdownColor: primaryColor,
                      decoration: InputDecoration(
                        hintText: 'Class',
                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                      value: searchController.selectedClass.value,
                      items: searchController.classes
                          .map((classItem) => DropdownMenuItem(
                                value: classItem,
                                child: Text(
                                  classItem,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        searchController.setSelectedClass(value!);
                      },
                      validator: (value) =>
                          value == null ? "Class is required" : null,
                    )),
                const SizedBox(height: 16),
                Obx(() => DropdownButtonFormField<String>(
                      dropdownColor: primaryColor,
                      decoration: const InputDecoration(
                          hintText: 'Subject',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 208, 207, 207))),
                      value: searchController.selectedSubject.value,
                      items: searchController.subjects
                          .map((subject) => DropdownMenuItem(
                                value: subject,
                                child: Text(
                                  subject,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        searchController.setSelectedSubject(value!);
                      },
                      validator: (value) =>
                          value == null ? "Subject is required" : null,
                    )),
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
