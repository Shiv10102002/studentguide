import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/controller/sign_in_controller.dart';

import '../../../constant.dart';
import '../forgot_password_screen.dart';

class SignInForm extends StatelessWidget {
  final SignInController _controller = Get.put(SignInController());

  SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller.emailController,
          validator: emailValidator.call,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: "Email Address"),
        ),
        const SizedBox(height: defaultPadding),

        // Password Field
        Obx(() => TextFormField(
              controller: _controller.passwordController,
              obscureText: _controller.obscureText, // Use the getter
              validator: passwordValidator.call,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: GestureDetector(
                  onTap: _controller.toggleObscureText, // Use the method
                  child: Icon(
                    _controller.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: bodyTextColor,
                  ),
                ),
              ),
            )),
        const SizedBox(height: defaultPadding),

        // Forget Password
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgotPasswordScreen(),
            ),
          ),
          child: Text(
            "Forget Password?",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: defaultPadding),

        // Sign In Button
        Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minimumSize: Size(MediaQuery.of(context).size.width, 40),
                backgroundColor: primaryColor,
              ),
              onPressed: _controller.isLoading.value
                  ? null
                  : () {
                      _controller.signIn();
                    },
              child: _controller.isLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text("Sign in",
                      style: TextStyle(color: Colors.white)),
            )),
      ],
    );
  }
}
