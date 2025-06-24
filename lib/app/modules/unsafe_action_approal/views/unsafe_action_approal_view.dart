import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/app/widgets/global_widget.dart';
import 'package:hsse2/utils/values/colors.dart';
import '../controllers/unsafe_action_approal_controller.dart';

class UnsafeActionApproalView extends GetView<UnsafeActionApproalController> {
  UnsafeActionApproalView({super.key});

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.idJenisUnsafe = data['idjenisunsafe'];
    controller.idunsafe = data['idunsafe'];
    controller.getDetailUnsafe(data['idunsafe']);

    return Scaffold(
      appBar: GlobalAppBar(
        pTitle:
            controller.idJenisUnsafe == 1
                ? "Respon Unsafe Action"
                : "Respon Unsafe Condition",
        pBgColor: CustomColor.appBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Konfirmasi Temuan",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<int>(
                            value: 0,
                            groupValue: controller.konfirmasiTemuan.value,
                            onChanged:
                                (value) =>
                                    controller.konfirmasiTemuan.value = value!,
                            visualDensity: VisualDensity.compact,
                          ),
                          const Text(
                            "Diterima",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: controller.konfirmasiTemuan.value,
                            onChanged:
                                (value) =>
                                    controller.konfirmasiTemuan.value = value!,
                            visualDensity: VisualDensity.compact,
                          ),
                          const Text("Ditolak", style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
                buildTextField(
                  "Penanggung Jawab",
                  controller.penanggungJawabTF,
                  readOnly: true,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Status Pengerjaan",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<int>(
                            value: 0,
                            groupValue: controller.selectedStatus.value,
                            onChanged:
                                (value) =>
                                    controller.selectedStatus.value = value!,
                            visualDensity: VisualDensity.compact,
                          ),
                          const Text(
                            "Belum Dikerjakan",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: controller.selectedStatus.value,
                            onChanged:
                                (value) =>
                                    controller.selectedStatus.value = value!,
                            visualDensity: VisualDensity.compact,
                          ),
                          const Text(
                            "Proses Pengerjaan",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Radio<int>(
                            value: 2,
                            groupValue: controller.selectedStatus.value,
                            onChanged:
                                (value) =>
                                    controller.selectedStatus.value = value!,
                            visualDensity: VisualDensity.compact,
                          ),
                          const Text("Selesai", style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Update Temuan",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
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
                buildTextField(
                  "Catatan Tambahan",
                  controller.catatanTambahanTF,
                  maxLines: 3,
                ),

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.responUnsafe,
                    child: Text(
                      "Simpan Respon",
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
