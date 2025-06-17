import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/app/widgets/global_widget.dart';
import 'package:hsse2/utils/values/colors.dart';

import '../controllers/unsafe_action_form_controller.dart';

class UnsafeActionFormView extends GetView<UnsafeActionFormController> {
  UnsafeActionFormView({super.key});

  var controller = Get.put(UnsafeActionFormController());

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.idJenisUnsafe = data['idjenisunsafe'];
    controller.getSoalUnsafe(controller.idJenisUnsafe);
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: controller.idJenisUnsafe == 1 ? "Form Unsafe Action" : "Form Unsafe Condition",
        pBgColor: CustomColor.appBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField("Nama", controller.namaTF),
                buildTextField(
                  "Tanggal Temuan",
                  controller.tglTemuanTF,
                  readOnly: true,
                  onTap: () => controller.selectTanggalTemuan(context),
                ),
                buildTextField(
                  "Waktu",
                  controller.waktuTF,
                  readOnly: true,
                  onTap: () => controller.selectWaktu(context),
                ),
                buildTextField("Lokasi", controller.lokasiTF),
                buildTextField("PIC", controller.picTF),

                const SizedBox(height: 16),
                const Text(
                  "Penyebab Ketidaksesuaian",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                GetBuilder<UnsafeActionFormController>(
                  init: UnsafeActionFormController(),
                  builder: (ctx) {
                    return ListView.separated(
                      itemCount: ctx.listPertanyaan.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final isLainnya =
                            ctx.listPertanyaan[index].namapertanyaanunsafe ==
                            "Lainnya";

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!isLainnya) ...[
                              CheckboxListTile(
                                title: Text(
                                  ctx
                                      .listPertanyaan[index]
                                      .namapertanyaanunsafe!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                    height: 1.2,
                                  ),
                                ),
                                value: ctx.listJawaban[index]["jawaban"],
                                onChanged: (bool? value) {
                                  ctx.changeListJawaban(
                                    ctx
                                        .listPertanyaan[index]
                                        .idpertanyaanunsafe!,
                                  );
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                dense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 1,
                                ),
                                visualDensity: const VisualDensity(
                                  horizontal: 0,
                                  vertical: -4,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                tileColor: Colors.grey.shade100,
                                selectedTileColor: Colors.teal.shade50,
                                activeColor: Colors.teal,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ],
                            if (isLainnya) ...[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: ctx.listJawaban[index]["jawaban"],
                                      onChanged: (bool? value) {
                                        ctx.changeListJawaban(
                                          ctx
                                              .listPertanyaan[index]
                                              .idpertanyaanunsafe!,
                                        );
                                      },
                                      activeColor: Colors.teal,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: ctx.lainnyaController,
                                        style: const TextStyle(fontSize: 13),
                                        decoration: InputDecoration(
                                          hintText:
                                              "Tulis keterangan lainnya...",
                                          hintStyle: const TextStyle(
                                            color:
                                                Colors
                                                    .grey, // Ubah ke warna yang kamu mau
                                            fontSize: 13,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[100],
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 10,
                                              ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        onChanged:
                                            (val) =>
                                                ctx.listJawaban[index]["Lainnya"] =
                                                    val,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 5);
                      },
                    );
                  },
                ),

                const SizedBox(height: 5),

                buildTextField(
                  "Catatan / Keterangan Tambahan",
                  controller.catatanTF,
                  maxLines: 3,
                ),
                buildTextField(
                  "Impac / Dampak",
                  controller.impacTF,
                  maxLines: 3,
                ),
                buildTextField(
                  "Rekomendasi",
                  controller.rekomendasiTF,
                  maxLines: 3,
                ),

                const SizedBox(height: 5),
                const Text(
                  "Dokumentasi (Foto)",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),

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

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.submit,
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
