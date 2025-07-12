import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/utils/values/colors.dart';

import '../controllers/unsafe_action_controller.dart';

class UnsafeActionView extends GetView<UnsafeActionController> {
  var controller = Get.put(UnsafeActionController());

  var arguments = Get.arguments;

  UnsafeActionView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.idjenisunsafe = arguments['idjenisunsafe'];
    controller.getListUnsafe(controller.idjenisunsafe);
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle:
            controller.idjenisunsafe == 1
                ? "Unsafe Action"
                : "Unsafe Condition",
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
                      data[index].idunsafe!,
                      data[index].idjenisunsafe!,
                      data[index].username!,
                      data[index].tgltemuan.toString(),
                      data[index].status!,
                      data[index].namajenisunsafe!,
                      data[index].penanggungjawab ?? "Belum Direspon",
                      data[index].nama!,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 0);
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
    final isAction = jenisUnsafe.toUpperCase() == "ACTION";
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
                      Routes.UNSAFE_ACTION_DETAIL,
                      arguments: {
                        "idunsafe": idunsafe,
                        "idjenisunsafe": idjenisunsafe,
                        'asal': arguments["asal"],
                      },
                    );
                  }
                },
                itemBuilder:
                    (context) => [
                      PopupMenuItem<int>(value: 1, child: arguments["asal"] == 'approve' ? Text('Approve') : Text('Detail')),
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

          // Kategori dan Status (Chips)
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              Chip(
                label: Text("UNSAFE $jenisUnsafe"),
                backgroundColor: isAction ? Colors.red[100] : Colors.blue[100],
                labelStyle: TextStyle(
                  color: isAction ? Colors.red[700] : Colors.blue[800],
                  fontWeight: FontWeight.w600,
                ),
                visualDensity: VisualDensity.compact,
              ),
              Chip(
                label: Text(isClosed ? "Close" : "Open"),
                backgroundColor: isClosed ? Colors.red[100] : Colors.green[100],
                labelStyle: TextStyle(
                  color: isClosed ? Colors.red : Colors.green[800],
                  fontWeight: FontWeight.w600,
                ),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Informasi Tgl dan Direspon Oleh
          Text(
            "Tgl Temuan : ${tgltemuan.split(' ')[0]}",
            style: GoogleFonts.poppins(fontSize: 12),
          ),
          Text(
            "Direspon Oleh : $perespon",
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
