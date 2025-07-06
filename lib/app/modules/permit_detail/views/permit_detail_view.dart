import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/permit_detail_controller.dart';

class PermitDetailView extends GetView<PermitDetailController> {
  const PermitDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PermitDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PermitDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
