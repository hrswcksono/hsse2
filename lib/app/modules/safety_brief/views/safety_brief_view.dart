import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
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
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  Routes.SAFETY_BRIEF_FORM);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                minimumSize: const Size(40, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Tambah'),
            ),
            // Expanded(
            //   child: controller.obx(
            //     (data) => ListView.separated(
            //       shrinkWrap: true,
            //       physics: const ClampingScrollPhysics(),
            //       itemCount: data!.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return itemUnsafe(
            //           data[index].idunsafe!,
            //           data[index].idjenisunsafe!,
            //           data[index].username!,
            //           data[index].tgltemuan.toString(),
            //           data[index].status!,
            //           data[index].namajenisunsafe!,
            //           data[index].penanggungjawab ?? "Belum Direspon",
            //         );
            //       },
            //       separatorBuilder: (BuildContext context, int index) {
            //         return const SizedBox(height: 10);
            //       },
            //     ),
            //   ),
            // ),
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
  ) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color:
              jenisUnsafe == "ACTION"
                  ? const Color.fromRGBO(240, 67, 31, 1)
                  : const Color.fromRGBO(55, 180, 251, 1),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pelapor", style: GoogleFonts.poppins(fontSize: 18)),
              PopupMenuButton<int>(
                color: Colors.white,
                // offset: Offset(dx, dy),
                onSelected: (int item) {
                  if (item == 1) {
                    Get.toNamed(
                      Routes.UNSAFE_ACTION_DETAIL,
                      arguments: {
                        "idunsafe": idunsafe.toString(),
                        "idjenisunsafe": idjenisunsafe.toString(),
                        "jenis":
                            "Unsafe ${jenisUnsafe[0].toUpperCase()}${jenisUnsafe.substring(1).toLowerCase()}",
                        "from": "buat",
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
          Text(namapelapor, style: GoogleFonts.poppins(fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Kategori : ", style: GoogleFonts.poppins(fontSize: 10)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color:
                      jenisUnsafe == "ACTION"
                          ? const Color.fromRGBO(240, 67, 31, 1)
                          : const Color.fromRGBO(55, 180, 251, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Text("UNSAFE $jenisUnsafe"),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status : ", style: GoogleFonts.poppins(fontSize: 10)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: status == 'I' ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(status == 'I' ? "Open" : "Close"),
              ),
            ],
          ),
          Text(
            "Tgl Temuan : ${tgltemuan.split(' ')[0]}",
            style: GoogleFonts.poppins(fontSize: 10),
          ),
          Text(
            "Direspon Oleh : ${perespon}",
            style: GoogleFonts.poppins(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
