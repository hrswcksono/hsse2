import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_ah_controller.dart';

class LaporanAhView extends GetView<LaporanAhController> {
  const LaporanAhView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaporanAhView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LaporanAhView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
