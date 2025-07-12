import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/utils/helpers/helpers.dart';
import 'package:hsse2/utils/values/colors.dart';

import '../controllers/safety_brief_controller.dart';

class SafetyBriefView extends GetView<SafetyBriefController> {
  const SafetyBriefView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Safety Briefing",
        pBgColor: CustomColor.appBarColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: controller.obx(
                (data) => ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return itemUnsafe(
                      data[index].idsafetybrief!,
                      data[index].idsafetybrief!,
                      data[index].departemen!,
                      data[index].tgltrans.toString(),
                      data[index].status!,
                      data[index].namapekerja!,
                      data[index].namapekerjaan ?? "Belum Direspon",
                      "sdad"
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container itemUnsafe(
    int idunsafe,
    int idjenisunsafe,
    String namapelapor,
    String tgltemuan,
    String status,
    String jenisUnsafe,
    String perespon,
    String title,
  ) {
    final isClosed = status != 'I';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Pelapor + Menu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.poppins(fontSize: 14)),
              PopupMenuButton<int>(
                color: Colors.white,
                onSelected: (int item) {
                  if (item == 1) {
                    Get.toNamed(
                      Routes.SAFETY_BRIEF_DETAIL,
                      arguments: {
                        "idsafetybrief": idunsafe,
                      },
                    );
                  }
                },
                itemBuilder:
                    (context) => const [
                      PopupMenuItem<int>(value: 1, child: Text('Detail')),
                    ],
                child: const Icon(Icons.more_vert),
              ),
            ],
          ),

          // Nama Pelapor
          Text(
            namapelapor,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Informasi Tgl dan Direspon Oleh
          Text(
            "Tgl : ${formatDate(tgltemuan)}",
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
