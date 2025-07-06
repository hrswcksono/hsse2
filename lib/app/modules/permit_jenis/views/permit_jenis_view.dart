import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/permit_jenis_controller.dart';

class PermitJenisView extends GetView<PermitJenisController> {
  const PermitJenisView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PermitJenisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PermitJenisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
