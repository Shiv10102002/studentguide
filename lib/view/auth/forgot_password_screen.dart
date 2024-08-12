import 'package:flutter/material.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/view/auth/components/forgot_pass_form.dart';

import '../../components/welcome_text.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeText(
                title: "Forgot password",
                text:
                    "Enter your email address and we will \nsend you a reset instructions."),
            const SizedBox(height: defaultPadding),
            ForgotPassForm(),
          ],
        ),
      ),
    );
  }
}
