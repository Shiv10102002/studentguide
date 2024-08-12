// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentguide/constant.dart';
// import 'package:studentguide/controller/signup_controller.dart';

// class SignUpForm extends StatelessWidget {
//   final SignUpController controller = Get.put(SignUpController());

//   SignUpForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: controller.formKey,
//       child: Column(
//         children: [
//           // Full Name Field
//           TextFormField(
//             validator: requiredValidator.call,
//             onSaved: (value) {},
//             textInputAction: TextInputAction.next,
//             decoration: const InputDecoration(hintText: "Full Name"),
//           ),
//           const SizedBox(height: defaultPadding),

//           // Email Field
//           TextFormField(
//             validator: emailValidator.call,
//             onSaved: (value) {},
//             textInputAction: TextInputAction.next,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(hintText: "Email Address"),
//           ),
//           const SizedBox(height: defaultPadding),

//           // College Name Field
//           TextFormField(
//             validator: requiredValidator.call,
//             onSaved: (value) {},
//             textInputAction: TextInputAction.next,
//             decoration: const InputDecoration(hintText: "School/College Name"),
//           ),
//           const SizedBox(height: defaultPadding),

//           // Class Field (Dropdown)
//           Obx(() {
//             return DropdownButtonFormField<String>(
//               value: controller.selectedClass,
//               onChanged: (value) {
//                 if (value != null) {
//                   controller.setSelectedClass(value);
//                 }
//               },
//               items: List.generate(12, (index) {
//                 return DropdownMenuItem(
//                   value: (index + 1).toString(),
//                   child: Text('Class ${(index + 1).toString()}'),
//                 );
//               }),
//               decoration: const InputDecoration(hintText: "Class"),
//             );
//           }),
//           const SizedBox(height: defaultPadding),

//           // Password Field
//           Obx(() {
//             return TextFormField(
//               obscureText: controller.obscureText,
//               validator: passwordValidator.call,
//               textInputAction: TextInputAction.next,
//               onChanged: (value) {},
//               onSaved: (value) {},
//               decoration: InputDecoration(
//                 hintText: "Password",
//                 suffixIcon: GestureDetector(
//                   onTap: controller.toggleObscureText,
//                   child: Icon(
//                     controller.obscureText
//                         ? Icons.visibility_off
//                         : Icons.visibility,
//                     color: bodyTextColor,
//                   ),
//                 ),
//               ),
//             );
//           }),
//           const SizedBox(height: defaultPadding),

//           // Confirm Password Field
//           Obx(() {
//             return TextFormField(
//               obscureText: controller.obscureText,
//               decoration: InputDecoration(
//                 hintText: "Confirm Password",
//                 suffixIcon: GestureDetector(
//                   onTap: controller.toggleObscureText,
//                   child: Icon(
//                     controller.obscureText
//                         ? Icons.visibility_off
//                         : Icons.visibility,
//                     color: bodyTextColor,
//                   ),
//                 ),
//               ),
//             );
//           }),
//           const SizedBox(height: defaultPadding),

//           // Sign Up Button
//           ElevatedButton(
//             onPressed: () {
//               if (controller.formKey.currentState!.validate()) {
//                 controller.formKey.currentState!.save();
//                 // Perform sign up actions
//               }
//             },
//             child: const Text("Sign Up"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/components/buttons/primary_button.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/signup_controller.dart';

class SignUpForm extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

   SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Full Name Field
          TextFormField(
            controller: controller.fullNameController,
            validator: requiredValidator.call,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "Full Name"),
          ),
          const SizedBox(height: defaultPadding),

          // Email Field
          TextFormField(
            controller: controller.emailController,
            validator: emailValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(height: defaultPadding),

          // College Name Field
          TextFormField(
            controller: controller.collegeNameController,
            validator: requiredValidator.call,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "School/College Name"),
          ),
          const SizedBox(height: defaultPadding),

          // Class Field (Dropdown)
          Obx(() {
            return DropdownButtonFormField<String>(
              value: controller.selectedClass,
              onChanged: (value) {
                if (value != null) {
                  controller.setSelectedClass(value);
                }
              },
              items: List.generate(12, (index) {
                return DropdownMenuItem(
                  value: (index + 1).toString(),
                  child: Text(
                    'Class ${(index + 1).toString()}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 123, 122, 122)),
                  ),
                );
              }),
              decoration: const InputDecoration(
                  hintText: "Class",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 208, 207, 207))),
            );
          }),
          const SizedBox(height: defaultPadding),

          // Password Field
          Obx(() {
            return TextFormField(
              controller: controller.passwordController,
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

          // Confirm Password Field
          Obx(() {
            return TextFormField(
              controller: controller.confirmPasswordController,
              obscureText: controller.obscureText,
              validator: (value) {
                if (value != controller.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Confirm Password",
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

          // Sign Up Button
          PrimaryButton(text: 'Sign Up', press: controller.signUp)
          // ElevatedButton(
          //   onPressed: controller.signUp,
          //   child: const Text("Sign Up"),
          // ),
        ],
      ),
    );
  }
}
