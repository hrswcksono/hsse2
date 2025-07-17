import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/modules/permit_list/controllers/permit_list_controller.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/utils/helpers/function.dart';
import 'package:hsse2/utils/helpers/helpers.dart';
import 'package:hsse2/utils/values/colors.dart';
import 'package:hsse2/utils/values/get_storage_key.dart';
import 'package:hsse2/utils/values/string_const.dart';

class PermitListView extends GetView<PermitListController> {
  var arguments = Get.arguments;

  PermitListView({super.key});
  @override
  Widget build(BuildContext context) {
    print(arguments['asal']);
    controller.initList(arguments["idjenispermit"], arguments["asal"]);
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: arguments['namapermit'],
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
                    return itemPermit(
                      data[index].idpermit!,
                      data[index].idjenispermit!,
                      data[index].namaproject!,
                      data[index].tgltrans.toString(),
                      data[index].status!,
                      data[index].lokasi!,
                      data[index].kodepermit!,
                      data[index].deskripsi!,
                      data[index].sudahapprove == 1,
                      GetStorage().read(GetStorageKey.namarole) == 'SPV HSE' &&
                          data[index].siapselesai == 1,
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

  Container itemPermit(
    int idpermit,
    int idjenispermit,
    String namapelapor,
    String tgltemuan,
    String status,
    String jenisUnsafe,
    String perespon,
    String title,
    bool sudahapprove,
    bool siapselesai,
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
                      Routes.PERMIT_DETAIL,
                      arguments: {
                        "idpermit": idpermit,
                        "idjenispermit": idjenispermit,
                        'asal': arguments["asal"],
                        'action': 'approve',
                      },
                    );
                  } else if (item == 2) {
                    Get.toNamed(
                      Routes.PERMIT_DETAIL,
                      arguments: {
                        "idpermit": idpermit,
                        "idjenispermit": idjenispermit,
                        'asal': arguments["asal"],
                        'action': 'selesai',
                      },
                    );
                  } else if (item == 3) {
                    downloadFile("${StringConst.baseUrl}permit/cetak/$idpermit", "$title.pdf");
                  }
                },
                itemBuilder:
                    (context) => [
                      PopupMenuItem<int>(
                        value: 1,
                        child:
                            arguments["asal"] == 'approve'
                                ? Text('Approve')
                                : Text('Detail'),
                      ),
                      if (siapselesai) ...[
                        PopupMenuItem<int>(value: 2, child: Text('Selesaikan')),
                      ],
                      PopupMenuItem<int>(value: 3, child: Text('Cetak')),
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

          const SizedBox(height: 5),

          // Informasi Tgl dan Direspon Oleh
          Text(
            "Tgl Temuan : ${formatDate(tgltemuan)}",
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
