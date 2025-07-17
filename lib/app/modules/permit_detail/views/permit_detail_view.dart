import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/app/widgets/global_widget.dart';
import 'package:hsse2/utils/values/colors.dart';

import '../controllers/permit_detail_controller.dart';

class PermitDetailView extends GetView<PermitDetailController> {
  PermitDetailView({super.key});
  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Detail Permit",
        pBgColor: CustomColor.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Nama", controller.namaProjectTF, readOnly: true),
              buildTextField("Bagian", controller.bagianTF, readOnly: true),
              buildTextField(
                "Perusahaan",
                controller.perusahaanTF,
                readOnly: true,
              ),
              buildTextField("Lokasi", controller.lokasiTF, readOnly: true),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: buildTextField(
                      "Tanggal",
                      controller.tanggalKerjaTF,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: buildTextField(
                      "Jam",
                      controller.jamTF,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              buildTextField(
                "Nomor Ijin",
                controller.nomorIjinTF,
                readOnly: true,
              ),
              buildTextField(
                "Jumlah Pekerja",
                controller.jumlahPekerjaTF,
                readOnly: true,
              ),
              buildTextField(
                "Deskripsi",
                controller.deskripsiTF,
                readOnly: true,
              ),
              const SizedBox(height: 10),
              GetBuilder<PermitDetailController>(
                builder: (pctx) {
                  return ListView.separated(
                    itemCount: controller.listPertanyaan.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder:
                        (BuildContext context, int index) =>
                            const SizedBox(height: 12),
                    itemBuilder: (BuildContext context, int index) {
                      final pertanyaan = controller.listPertanyaan[index];
                      final jenis =
                          pertanyaan.jenispertanyaan?.toLowerCase() ?? '';
                      final isBahaya = jenis.contains("bahaya");
                      final isTahap3 = jenis.contains("pelindung");

                      print(pctx.listjawaban);

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => controller.changeListHide(index),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                ),
                                child: Text(
                                  pertanyaan.jenispertanyaan!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),

                            if (controller.listHideSoal[index] == true)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Jika tahap 3, kelompokkan berdasarkan grup
                                  if (isTahap3)
                                    _buildGroupedTahap3(pertanyaan, index)
                                  else
                                    // Untuk non-tahap3, tampilkan seperti biasa
                                    ...pertanyaan.data!.asMap().entries.map((
                                      entry,
                                    ) {
                                      final idx = entry.key;
                                      final soal = entry.value;

                                      if (isBahaya) {
                                        // Pastikan data tersedia
                                        if (index >=
                                                controller.listjawaban.length ||
                                            idx >=
                                                controller
                                                    .listjawaban[index]
                                                    .length) {
                                          return const SizedBox();
                                        }

                                        // Ambil data bahaya dari listjawaban
                                        final rawData =
                                            controller.listjawaban[index][idx];
                                        final List<Map<String, dynamic>>
                                        listBahaya =
                                            rawData is List
                                                ? List<
                                                  Map<String, dynamic>
                                                >.from(rawData)
                                                : [];

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${idx + 1}. ${soal.namapertanyaan}",
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            ...listBahaya.asMap().entries.map((
                                              e,
                                            ) {
                                              final itemIdx = e.key;
                                              final item = e.value;

                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 8.0,
                                                ),
                                                child: Row(
                                                  children: [
                                                    // input jam
                                                    Expanded(
                                                      child: TextField(
                                                        readOnly:
                                                            true, // ✅ readonly
                                                        controller:
                                                            TextEditingController(
                                                              text:
                                                                  item["jam"] ??
                                                                  "",
                                                            ),
                                                        decoration: InputDecoration(
                                                          hintText: "Jam",
                                                          isDense: true,
                                                          contentPadding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 10,
                                                              ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors
                                                                  .grey
                                                                  .shade100,
                                                          suffixIcon: const Icon(
                                                            Icons.access_time,
                                                            size: 18,
                                                            color: Colors.grey,
                                                          ),
                                                          suffixIconConstraints:
                                                              const BoxConstraints(
                                                                minHeight: 24,
                                                                minWidth: 24,
                                                              ),
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  6,
                                                                ),
                                                          ),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),

                                                    // input aktual
                                                    Expanded(
                                                      child: TextField(
                                                        readOnly:
                                                            true, // ✅ readonly
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        textAlign:
                                                            TextAlign.right,
                                                        controller:
                                                            TextEditingController(
                                                              text:
                                                                  item["jml"]
                                                                      .toString() ??
                                                                  "",
                                                            ),
                                                        decoration: InputDecoration(
                                                          hintText: "Aktual",
                                                          isDense: true,
                                                          contentPadding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 10,
                                                              ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors
                                                                  .grey
                                                                  .shade100,
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  6,
                                                                ),
                                                          ),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 6),

                                                    // tombol hapus dan tambah (disabled)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                2.0,
                                                              ),
                                                          child: Icon(
                                                            Icons.delete,
                                                            size: 16,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                2.0,
                                                              ),
                                                          child: Icon(
                                                            Icons.add,
                                                            size: 16,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ],
                                        );
                                      } else {
                                        // Normal checkbox - ambil dari listjawaban
                                        // Pastikan data ada dan dalam format yang benar
                                        if (index >=
                                                controller.listjawaban.length ||
                                            idx >=
                                                controller
                                                    .listjawaban[index]
                                                    .length) {
                                          return const SizedBox(); // Skip jika data tidak ada
                                        }

                                        final jawabanData =
                                            controller.listjawaban[index][idx];
                                        final isChecked =
                                            jawabanData is Map<String, dynamic>
                                                ? (jawabanData["jawaban"] ==
                                                        true ||
                                                    jawabanData["jawaban"] == 1)
                                                : false;
                                        final isLainnya = soal.namapertanyaan!
                                            .toLowerCase()
                                            .contains("lainnya");

                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 2,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child:
                                                    isLainnya && isChecked
                                                        ? Row(
                                                          children: [
                                                            Text(
                                                              "${idx + 1}. ",
                                                            ),
                                                            Expanded(
                                                              child: TextField(
                                                                readOnly:
                                                                    true, // ✅ readonly
                                                                controller: TextEditingController(
                                                                  text:
                                                                      (jawabanData
                                                                              is Map<
                                                                                String,
                                                                                dynamic
                                                                              >)
                                                                          ? (jawabanData["namapertanyaan"] ??
                                                                              "")
                                                                          : "",
                                                                ),
                                                                decoration: InputDecoration(
                                                                  hintText:
                                                                      "Tuliskan jenis pekerjaan lainnya...",
                                                                  hintStyle:
                                                                      const TextStyle(
                                                                        color:
                                                                            Colors.black54,
                                                                      ),
                                                                  isDense: true,
                                                                  contentPadding:
                                                                      const EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            8,
                                                                      ),
                                                                  filled: true,
                                                                  fillColor:
                                                                      Colors
                                                                          .grey
                                                                          .shade100,
                                                                  border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          6,
                                                                        ),
                                                                    borderSide: BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .grey
                                                                              .shade300,
                                                                    ),
                                                                  ),
                                                                  enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          6,
                                                                        ),
                                                                    borderSide: BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .grey
                                                                              .shade300,
                                                                    ),
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          6,
                                                                        ),
                                                                    borderSide: BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .grey
                                                                              .shade300,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                        : Text(
                                                          "${idx + 1}. ${soal.namapertanyaan}",
                                                        ),
                                              ),
                                              Checkbox(
                                                value: isChecked,
                                                onChanged: null, // ✅ readonly
                                                checkColor: Colors.teal.shade50,
                                                activeColor: Colors.teal,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    }),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap:
                                          () =>
                                              controller.changeListHide(index),
                                      child: Text(
                                        'Collapse',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black87,
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 10),

              const Text(
                "Status Pekerjaan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              buildCheckbox(
                'Pekerjaan telah dilakukan sesuai prosedur dengan menerapkan pengendalian risiko yang telah diidentifikasi sebelumnya',
                controller.pekerjaanSesuaiProsedur,
                disabled: true,
                disabledTileColor: Colors.teal,
              ),
              buildCheckbox(
                'Semua kondisi, risiko, dan pengendalian pekerjaan telah disampaikan kepada pelaksana pekerjaan',
                controller.pekerjaanTelahDisampaikan,
                disabled: true,
              ),
              buildCheckbox(
                'Kondisi lokasi kerja sudah benar-benar dipastikan aman untuk dilakukan pekerjaan',
                controller.lokasiPastiAman,
                disabled: true,
              ),

              const Text(
                "Izin kerja diberkan untuk dijalankan seperti yang tertera di atas selama:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: buildTextField(
                      "Dari Tanggal",
                      controller.tanggalAwalSuratTF,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: buildTextField(
                      "Jam",
                      controller.jamAwalSuratTF,
                      readOnly: true,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: buildTextField(
                      "Sampai Tanggal",
                      controller.tanggalAkhirSuratTF,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: buildTextField(
                      "Jam",
                      controller.jamAkhirSuratTF,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              const Text(
                "Tanda tangan pembuat",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Obx(() {
                return Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Image.network(
                      controller.ttdbuat.value,
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text("Gagal memuat gambar TTD"),
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          arguments["asal"] == 'approve' ||
                  (arguments["asal"] == 'list')
              ? SafeArea(
                top: false,
                left: false,
                right: false,
                bottom: true,
                child: Container(
                  color: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        Routes.PERMIT_APPROVE,
                        arguments: {
                          "id": arguments['idpermit'],
                          "sudahapprove1": controller.sudahapprove1,
                          "sudahapprove2": controller.sudahapprove2,
                          "sudahapprove3": controller.sudahapprove3,
                          "ttdapprove1": controller.ttdapprove1,
                          "ttdapprove2": controller.ttdapprove2,
                          "ttdapprove3": controller.ttdapprove3,
                          "statuspenyelesaian": controller.statuspenyelaian,
                          "ttdpenyelesaian": controller.ttdpenyelesaian,
                        },
                      );
                    },
                    child: Text(
                      arguments["asal"] == 'approve' ? "Approve" : 'Detail',
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                  ),
                ),
              )
              : SizedBox(height: 50),
    );
  }

  // Method untuk mengelompokkan pertanyaan tahap 3
  Widget _buildGroupedTahap3(pertanyaan, int index) {
    // Kelompokkan berdasarkan namagrup
    final groupMap = <String, List<Map<String, dynamic>>>{};
    for (var i = 0; i < pertanyaan.data!.length; i++) {
      final item = pertanyaan.data![i];
      final group = item.namagrup ?? 'Lainnya';
      groupMap.putIfAbsent(group, () => []).add({
        'namapertanyaan': item.namapertanyaan,
        'namagrup': item.namagrup,
        'soalIndex': i,
        'data': item,
      });
    }

    List<Widget> groupWidgets = [];

    groupMap.forEach((groupName, questions) {
      groupWidgets.add(
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header grup
              Text(
                groupName,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade800,
                ),
              ),
              const SizedBox(height: 8),

              // Pertanyaan dalam grup
              ...questions.map((questionData) {
                final soalIndex = questionData['soalIndex'] as int;
                final soal = questionData['data'];

                // Pastikan data ada
                if (index >= controller.listjawaban.length ||
                    soalIndex >= controller.listjawaban[index].length) {
                  return const SizedBox();
                }

                // Ambil data dari listjawaban
                final jawabanData = controller.listjawaban[index][soalIndex];
                final isChecked =
                    jawabanData is Map<String, dynamic>
                        ? (jawabanData["jawaban"] == true ||
                            jawabanData["jawaban"] == 1)
                        : false;
                final isLainnya = soal.namapertanyaan!.toLowerCase().contains(
                  "lainnya",
                );

                return Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child:
                              isLainnya && isChecked
                                  ? Row(
                                    children: [
                                      Text("${soalIndex + 1}. "),
                                      Expanded(
                                        child: TextField(
                                          readOnly: true, // ✅ readonly
                                          controller: TextEditingController(
                                            text:
                                                (jawabanData
                                                        is Map<String, dynamic>)
                                                    ? (jawabanData["namapertanyaan"] ??
                                                        "")
                                                    : "",
                                          ),
                                          decoration: InputDecoration(
                                            hintText:
                                                "Tuliskan jenis pekerjaan lainnya...",
                                            hintStyle: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 0,
                                                ),
                                            filled: true,
                                            fillColor: Colors.grey.shade100,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade300,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade300,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    "${soalIndex + 1}. ${soal.namapertanyaan}",
                                    style: GoogleFonts.poppins(fontSize: 13),
                                  ),
                        ),
                        Checkbox(
                          value: isChecked,
                          onChanged: null, // ✅ readonly
                          checkColor: Colors.teal.shade50,
                          activeColor: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      );
    });

    return Column(children: groupWidgets);
  }
}
