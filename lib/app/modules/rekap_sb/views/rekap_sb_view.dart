import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rekap_sb_controller.dart';

class RekapSbView extends GetView<RekapSbController> {
  const RekapSbView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RekapSbView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RekapSbView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
