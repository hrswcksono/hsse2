import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rekap_permit_controller.dart';

class RekapPermitView extends GetView<RekapPermitController> {
  const RekapPermitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RekapPermitView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RekapPermitView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
