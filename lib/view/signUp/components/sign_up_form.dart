// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentguide/components/buttons/primary_button.dart';
// import 'package:studentguide/constant.dart';
// import 'package:studentguide/controller/student_register_controller.dart';

// class SignUpForm extends StatelessWidget {
//   final StudentRegisterController controller =
//       Get.put(StudentRegisterController());

//   SignUpForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: controller.formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Full Name Field
//           TextFormField(
//             controller: controller.fullNameController,
//             validator: requiredValidator.call,
//             textInputAction: TextInputAction.next,
//             decoration: const InputDecoration(hintText: "Full Name"),
//           ),
//           const SizedBox(height: defaultPadding),

//           // Email Field
//           TextFormField(
//             controller: controller.emailController,
//             validator: emailValidator.call,
//             textInputAction: TextInputAction.next,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(hintText: "Email Address"),
//           ),
//           const SizedBox(height: defaultPadding),

//           // College Name Field
//           TextFormField(
//             controller: controller.collegeNameController,
//             validator: requiredValidator.call,
//             textInputAction: TextInputAction.next,
//             decoration: const InputDecoration(hintText: "School/College Name"),
//           ),
//           const SizedBox(height: defaultPadding),

//           // fathers name

//           TextFormField(
//             controller: controller.fatherNameController,
//             validator: requiredValidator.call,
//             textInputAction: TextInputAction.next,
//             decoration: const InputDecoration(hintText: "Fathers Name"),
//           ),
//           const SizedBox(height: defaultPadding),

//           //schoolId
//           TextFormField(
//             controller: controller.schoolId,
//             validator: requiredValidator.call,
//             textInputAction: TextInputAction.next,
//             decoration: const InputDecoration(hintText: "School Id"),
//           ),
//           const SizedBox(height: defaultPadding),

//           TextFormField(
//             controller: controller.fatherNameController,
//             validator: requiredValidator.call,
//             textInputAction: TextInputAction.next,
//             decoration: const InputDecoration(hintText: "Address"),
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
//                   child: Text(
//                     'Class ${(index + 1).toString()}',
//                     style: const TextStyle(
//                         color: Color.fromARGB(255, 123, 122, 122)),
//                   ),
//                 );
//               }),
//               decoration: const InputDecoration(
//                   hintText: "Class",
//                   hintStyle:
//                       TextStyle(color: Color.fromARGB(255, 208, 207, 207))),
//             );
//           }),
//           const SizedBox(height: defaultPadding),

//           // Password Field
//           Obx(() {
//             return TextFormField(
//               controller: controller.passwordController,
//               obscureText: controller.obscureText,
//               validator: passwordValidator.call,
//               textInputAction: TextInputAction.next,
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
//               controller: controller.confirmPasswordController,
//               obscureText: controller.obscureText,
//               validator: (value) {
//                 if (value != controller.passwordController.text) {
//                   return 'Passwords do not match';
//                 }
//                 return null;
//               },
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
//           PrimaryButton(text: 'Sign Up', press: controller.signUp)
//           // ElevatedButton(
//           //   onPressed: controller.signUp,
//           //   child: const Text("Sign Up"),
//           // ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/components/buttons/primary_button.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/student_register_controller.dart';

class SignUpForm extends StatelessWidget {
  final StudentRegisterController controller =
      Get.put(StudentRegisterController());

  SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => controller.selectedImage == null
              ? TextButton(
                  onPressed: controller.pickImage,
                  child: const Text("Upload User ID Card"),
                )
              : Container(
                  height: 100,
                  child: Image.file(controller.selectedImage!),
                )),
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

          // Father's Name Field
          TextFormField(
            controller: controller.fatherNameController,
            validator: requiredValidator.call,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "Father's Name"),
          ),
          const SizedBox(height: defaultPadding),

          // // School ID Field
          // TextFormField(
          //   controller: controller.schoolName,
          //   validator: requiredValidator.call,
          //   textInputAction: TextInputAction.next,
          //   decoration: const InputDecoration(hintText: "School Name"),
          // ),
          // const SizedBox(height: defaultPadding),

          // Address Field
          TextFormField(
            controller: controller.address,
            validator: requiredValidator.call,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "Address"),
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
                hintStyle: TextStyle(color: Color.fromARGB(255, 208, 207, 207)),
              ),
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

          // User ID Card Image Picker

          const SizedBox(height: defaultPadding),

          // Sign Up Button
          PrimaryButton(text: 'Sign Up', press: controller.registerStudent),
        ],
      ),
    );
  }
}
