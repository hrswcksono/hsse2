import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/permit_soal_controller.dart';

class PermitSoalView extends GetView<PermitSoalController> {
  const PermitSoalView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PermitSoalView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PermitSoalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
