import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
// import 'package:studentguide/view/auth/reset_email_sent_screen.dart';
import 'package:studentguide/controller/forgot_password_controller.dart';

class ForgotPassForm extends StatelessWidget {
  final ForgotPasswordController _controller =
      Get.put(ForgotPasswordController());

  ForgotPassForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            controller: _controller.emailController,
            validator: emailValidator.call,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(height: defaultPadding),

          // Reset password Button
          Obx(() => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: Size(MediaQuery.of(context).size.width, 40)),
                onPressed: _controller.isLoading.value
                    ? null
                    : () {
                        _controller.sendResetPasswordEmail();
                      },
                child: _controller.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Reset password",
                        style: TextStyle(color: Colors.white),
                      ),
              )),
        ],
      ),
    );
  }
}
