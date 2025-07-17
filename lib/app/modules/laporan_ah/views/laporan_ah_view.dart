import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/app/widgets/global_widget.dart';
import 'package:hsse2/utils/helpers/function.dart';
import 'package:hsse2/utils/values/colors.dart';
import 'package:hsse2/utils/values/string_const.dart';

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
                  () => controller.selectTanggalTemuan(
                    context,
                    controller.tglTF,
                  ),
            ),

            SizedBox(height: 20,),
            globalButton("Cetak Laporan", onPressed: (){
              downloadFile("${StringConst.baseUrl}lah/export/${controller.tglTF.text}", "LAH-${controller.tglTF.text}.pdf");
            })
          ],
        ),
      ),
    );
  }
}
