import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unsafe_action_detail_controller.dart';

class UnsafeActionDetailView extends GetView<UnsafeActionDetailController> {
  const UnsafeActionDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnsafeActionDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UnsafeActionDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
