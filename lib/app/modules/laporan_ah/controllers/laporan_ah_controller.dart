import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LaporanAhController extends GetxController {
  late TextEditingController tglTF;

  @override
  void onInit() {
    super.onInit();

    tglTF = TextEditingController();
  }

  void selectTanggalTemuan(
    BuildContext context,
    TextEditingController param,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      param.text =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }
}
