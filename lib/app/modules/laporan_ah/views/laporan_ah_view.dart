import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/app/widgets/global_widget.dart';
import 'package:hsse2/utils/helpers/function.dart';
import 'package:hsse2/utils/values/colors.dart';
import 'package:hsse2/utils/values/string_const.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../controllers/laporan_ah_controller.dart';

class LaporanAhView extends GetView<LaporanAhController> {
  const LaporanAhView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Laporan Aktivitas Harian",
        pBgColor: CustomColor.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            buildTextField(
              "Tanggal",
              controller.tglTF,
              readOnly: true,
              onTap:
                  () =>
                      controller.selectTanggalTemuan(context, controller.tglTF),
            ),
            SizedBox(height: 20),

            // Button untuk download dan preview
            globalButton(
              "Cetak Laporan",
              onPressed: () {
                previewPDF(context: context, namaFile: "LAH-${controller.tglTF.text}.pdf", url: "${StringConst.baseUrl}lah/exporthtml/${controller.tglTF.text}");
              },
            ),
          ],
        ),
      ),
    );
  }

}
