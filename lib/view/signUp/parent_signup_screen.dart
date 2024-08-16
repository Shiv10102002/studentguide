import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/components/buttons/primary_button.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/parent_sign_up_controller.dart';

class ParentSignupScreen extends StatelessWidget {
  final ParentSignUpController controller = Get.put(ParentSignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Parent Register",
          style: darksemibold16.copyWith(fontSize: 18),
          textScaler: TextScaler.noScaling,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
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
              // const SizedBox(height: defaultPadding),

              // // Confirm Password Field
              // Obx(() {
              //   return TextFormField(
              //     controller: controller.passsController.value,
              //     obscureText: controller.obscureText,
              //     validator: (value) {
              //       if (value != controller.passsController.value.text) {
              //         return 'Passwords do not match';
              //       }
              //       return null;
              //     },
              //     decoration: InputDecoration(
              //       hintText: "Confirm Password",
              //       suffixIcon: GestureDetector(
              //         onTap: controller.toggleObscureText,
              //         child: Icon(
              //           controller.obscureText
              //               ? Icons.visibility_off
              //               : Icons.visibility,
              //           color: bodyTextColor,
              //         ),
              //       ),
              //     ),
              //   );
              // }),
              const SizedBox(height: defaultPadding),

              PrimaryButton(text: 'Signup', press: controller.signUp)
            ],
          ),
        ),
      ),
    );
  }
}
