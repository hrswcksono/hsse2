import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rekap_sp_controller.dart';

class RekapSpView extends GetView<RekapSpController> {
  const RekapSpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RekapSpView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RekapSpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
