import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/app/widgets/global_widget.dart';
import 'package:hsse2/utils/values/colors.dart';

import '../controllers/permit_form_controller.dart';

class PermitFormView extends GetView<PermitFormController> {
  PermitFormView({super.key});

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          await DialogAlert.showDialogConfirm(
            "Apakah anda yakin akan meninggalkan halaman ini, data yang sudah terisi akan hilang",
            () {
              Get.back(); // Tutup dialog
              Get.back(); // Pop halaman
            },
            () {
              Get.back(); // Tutup dialog saja
            },
          );
        }
      },
      child: Scaffold(
        appBar: GlobalAppBar(
          pTitle: data['namapermit'],
          pBgColor: CustomColor.appBarColor,
          onBack: () {
            DialogAlert.showDialogConfirm(
              "Apakah anda yakin akan meninggalkan halaman ini, data yang sudah terisi akan hilang",
              () {
                Get.back();
                Get.back();
              },
              () {
                Get.back();
              },
            );
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField("Nama", controller.namaProjectTF),
                buildTextField("Bagian", controller.bagianTF),
                buildTextField("Perusahaan", controller.perusahaanTF),
                buildTextField("Lokasi", controller.lokasiTF),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildTextField(
                        "Tanggal",
                        controller.tanggalKerjaTF,
                        readOnly: true,
                        onTap:
                            () => controller.selectTanggalTemuan(
                              context,
                              controller.tanggalKerjaTF,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: buildTextField(
                        "Jam",
                        controller.jamTF,
                        readOnly: true,
                        onTap:
                            () => controller.selectWaktu(
                              context,
                              controller.jamTF,
                            ),
                      ),
                    ),
                  ],
                ),
                buildTextField("Nomor Ijin", TextEditingController(text: ''), readOnly: true),
                buildTextField("Jumlah Pekerja", controller.jumlahPekerjaTF, numbersOnly: true),
                buildTextField("Deskripsi", controller.deskripsiTF),
                const SizedBox(height: 10),
                GetBuilder<PermitFormController>(
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
                                              ...controller.listjawaban[index][idx].asMap().entries.map((
                                                e,
                                              ) {
                                                final itemIdx = e.key;
                                                final item = e.value;

                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        bottom: 8.0,
                                                      ),
                                                  child: Row(
                                                    children: [
                                                      // input jam
                                                      Expanded(
                                                        child: TextField(
                                                          readOnly: true,
                                                          controller:
                                                              TextEditingController(
                                                                text:
                                                                    item["jam"] ??
                                                                    "",
                                                              ),
                                                          onTap: () async {
                                                            final picked =
                                                                await showTimePicker(
                                                                  context:
                                                                      context,
                                                                  initialTime:
                                                                      TimeOfDay.now(),
                                                                );
                                                            if (picked !=
                                                                null) {
                                                              item["jam"] =
                                                                  picked.format(
                                                                    context,
                                                                  );
                                                              controller
                                                                  .update();
                                                            }
                                                          },
                                                          decoration: InputDecoration(
                                                            hintText: "Jam",
                                                            isDense: true,
                                                            contentPadding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 10,
                                                                ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            suffixIcon: const Icon(
                                                              Icons.access_time,
                                                              size: 18,
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
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 13,
                                                              ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),

                                                      // input aktual
                                                      Expanded(
                                                        child: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number, // ✅ hanya angka
                                                          textAlign:
                                                              TextAlign
                                                                  .right, // ✅ rata kanan
                                                          controller:
                                                              TextEditingController(
                                                                text:
                                                                    item["keterangan"] ??
                                                                    "",
                                                              ),
                                                          onChanged: (val) {
                                                            item["keterangan"] =
                                                                val;
                                                          },
                                                          decoration: InputDecoration(
                                                            hintText: "Aktual",
                                                            isDense: true,
                                                            contentPadding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 10,
                                                                ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    6,
                                                                  ),
                                                            ),
                                                          ),
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 13,
                                                              ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 6),

                                                      // tombol hapus
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          InkWell(
                                                            onTap:
                                                                controller
                                                                            .listjawaban[index][idx]
                                                                            .length >
                                                                        1
                                                                    ? () {
                                                                      controller
                                                                          .listjawaban[index][idx]
                                                                          .removeAt(
                                                                            itemIdx,
                                                                          );
                                                                      controller
                                                                          .update();
                                                                    }
                                                                    : null,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  4,
                                                                ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets.all(
                                                                    2.0,
                                                                  ),
                                                              child: Icon(
                                                                Icons.delete,
                                                                size: 16,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .listjawaban[index][idx]
                                                                  .add({
                                                                    "jam": "",
                                                                    "keterangan":
                                                                        "",
                                                                  });
                                                              controller
                                                                  .update();
                                                            },
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  4,
                                                                ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets.all(
                                                                    2.0,
                                                                  ),
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 16,
                                                                color:
                                                                    Colors
                                                                        .black87,
                                                              ),
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
                                          // Normal checkbox
                                          final isChecked =
                                              controller
                                                  .listjawaban[index][idx]["jawaban"] ==
                                              true;
                                          final isLainnya = soal.namapertanyaan!
                                              .toLowerCase()
                                              .contains("lainnya");

                                          return InkWell(
                                            onTap:
                                                () => controller
                                                    .changeListJawaban(
                                                      index,
                                                      idx,
                                                    ),
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 2,
                                                  ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 0,
                                                  ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                                    onChanged: (
                                                                      val,
                                                                    ) {
                                                                      controller
                                                                              .listjawaban[index][idx]["namapertanyaan"] =
                                                                          val;
                                                                    },
                                                                    controller: TextEditingController.fromValue(
                                                                      TextEditingValue(
                                                                        text:
                                                                            controller.listjawaban[index][idx]["namapertanyaan"] ??
                                                                            "",
                                                                        selection: TextSelection.collapsed(
                                                                          offset:
                                                                              (controller.listjawaban[index][idx]["namapertanyaan"] ??
                                                                                      "")
                                                                                  .length,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    decoration: InputDecoration(
                                                                      hintText:
                                                                          "Tuliskan jenis pekerjaan lainnya...",
                                                                      hintStyle:
                                                                          const TextStyle(
                                                                            color:
                                                                                Colors.black54,
                                                                          ),
                                                                      isDense:
                                                                          true,
                                                                      contentPadding: const EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            8,
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          Colors
                                                                              .white,
                                                                      border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              6,
                                                                            ),
                                                                        borderSide: BorderSide(
                                                                          color:
                                                                              Colors.grey.shade300,
                                                                        ),
                                                                      ),
                                                                      enabledBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              6,
                                                                            ),
                                                                        borderSide: BorderSide(
                                                                          color:
                                                                              Colors.grey.shade300,
                                                                        ),
                                                                      ),
                                                                      focusedBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              6,
                                                                            ),
                                                                        borderSide: const BorderSide(
                                                                          color:
                                                                              Colors.black,
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
                                                    onChanged:
                                                        (_) => controller
                                                            .changeListJawaban(
                                                              index,
                                                              idx,
                                                            ),
                                                    checkColor:
                                                        Colors.teal.shade50,
                                                    activeColor: Colors.teal,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      }),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap:
                                            () => controller.changeListHide(
                                              index,
                                            ),
                                        child: Text(
                                          'Collapse',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.underline,
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
                ),
                buildCheckbox(
                  'Semua kondisi, risiko, dan pengendalian pekerjaan telah disampaikan kepada pelaksana pekerjaan',
                  controller.pekerjaanTelahDisampaikan,
                ),
                buildCheckbox(
                  'Kondisi lokasi kerja sudah benar-benar dipastikan aman untuk dilakukan pekerjaan',
                  controller.lokasiPastiAman,
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
                        onTap:
                            () => controller.selectTanggalTemuan(
                              context,
                              controller.tanggalAwalSuratTF,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: buildTextField(
                        "Jam",
                        controller.jamAwalSuratTF,
                        readOnly: true,
                        onTap:
                            () => controller.selectWaktu(
                              context,
                              controller.jamAwalSuratTF,
                            ),
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
                        onTap:
                            () => controller.selectTanggalTemuan(
                              context,
                              controller.tanggalAkhirSuratTF,
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: buildTextField(
                        "Jam",
                        controller.jamAkhirSuratTF,
                        readOnly: true,
                        onTap:
                            () => controller.selectWaktu(
                              context,
                              controller.jamAkhirSuratTF,
                            ),
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
                  return GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child:
                          controller.imageFile.value != null
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  controller.imageFile.value!,
                                  width: double.infinity,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              )
                              : const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Upload atau Ambil Foto",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false, // ⛔ tidak pakai safe di atas
          left: false,
          right: false,
          bottom: true, // ✅ hanya di bawah
          child: Container(
            color: Colors.teal,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                DialogAlert.showDialogConfirm(
                  "Apakah anda yakin akan menyimpan data ini?",
                  () {
                    controller.submitPermit();
                  },
                  () {
                    Get.back(); // Tutup dialog saja
                  },
                );
              },
              child: Text(
                "Submit",
                style: GoogleFonts.inter(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
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

                final isChecked =
                    controller.listjawaban[index][soalIndex]["jawaban"] == true;
                final isLainnya = soal.namapertanyaan!.toLowerCase().contains(
                  "lainnya",
                );

                return Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: InkWell(
                    onTap: () => controller.changeListJawaban(index, soalIndex),
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
                                            onChanged: (val) {
                                              controller
                                                      .listjawaban[index][soalIndex]["namapertanyaan"] =
                                                  val;
                                            },
                                            controller: TextEditingController.fromValue(
                                              TextEditingValue(
                                                text:
                                                    controller
                                                        .listjawaban[index][soalIndex]["namapertanyaan"] ??
                                                    "",
                                                selection: TextSelection.collapsed(
                                                  offset:
                                                      (controller.listjawaban[index][soalIndex]["namapertanyaan"] ??
                                                              "")
                                                          .length,
                                                ),
                                              ),
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
                                              fillColor: Colors.white,
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
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
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
                            onChanged:
                                (_) => controller.changeListJawaban(
                                  index,
                                  soalIndex,
                                ),
                            checkColor: Colors.teal.shade50,
                            activeColor: Colors.teal,
                          ),
                        ],
                      ),
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
