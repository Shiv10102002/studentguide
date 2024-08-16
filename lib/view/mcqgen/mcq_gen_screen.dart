import 'package:flutter/material.dart';
import 'package:studentguide/constant.dart';

class McqGenScreen extends StatelessWidget {
  const McqGenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Generat MCQ",
          textScaler: TextScaler.noScaling,
          style: darksemibold16.copyWith(fontSize: 18),
        ),
      ),
      body: Center(child: Text("Generate Mcq")),
    );
  }
}
