import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/components/buttons/primary_button.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/teacher_signup_controller.dart';

class TeacherSignupScreen extends StatelessWidget {
  TeacherSignupScreen({super.key});
  final TeacherSignupController controller = Get.put(TeacherSignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Teacher Register",
          style: darksemibold16.copyWith(fontSize: 18),
          textScaler: TextScaler.noScaling,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: controller.namecontroller.value,
                validator: requiredValidator.call,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Full Name"),
              ),
              const SizedBox(height: defaultPadding),

              // Email Field
              TextFormField(
                controller: controller.emailController.value,
                validator: emailValidator.call,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Email "),
              ),
              const SizedBox(height: defaultPadding),
              // School Name
              TextFormField(
                controller: controller.schoolNameController.value,
                validator: requiredValidator.call,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "School Name "),
              ),
              const SizedBox(height: defaultPadding),
              // address
              TextFormField(
                controller: controller.addController.value,
                validator: requiredValidator.call,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Address"),
              ),
              const SizedBox(height: defaultPadding),
              Obx(() {
                return TextFormField(
                  controller: controller.passsController.value,
                  obscureText: controller.obscureText,
                  validator: passwordValidator.call,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: controller.toggleObscureText,
                      child: Icon(
                        controller.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: bodyTextColor,
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: defaultPadding),

              const SizedBox(height: defaultPadding),

              PrimaryButton(text: 'Signup', press: controller.signUp)
            ],
          ),
        ),
      ),
    );
  }
}
