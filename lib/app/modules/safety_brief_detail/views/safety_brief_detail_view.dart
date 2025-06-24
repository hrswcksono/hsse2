import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/safety_brief_detail_controller.dart';

class SafetyBriefDetailView extends GetView<SafetyBriefDetailController> {
  const SafetyBriefDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafetyBriefDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SafetyBriefDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
