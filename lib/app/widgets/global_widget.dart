import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTextField(
  String label,
  TextEditingController controller, {
  int maxLines = 1,
  VoidCallback? onTap,
  bool readOnly = false,
  bool enabled = true,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          readOnly: readOnly,
          maxLines: maxLines,
          onTap: onTap,
          enabled: enabled,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100], // Tetap gunakan ini untuk semua status
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buttonMenu(
  String label,
  String asset, {
  VoidCallback? onTap,
  double size = 130, // ✅ default size jika tidak diisi
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(asset, fit: BoxFit.contain)),
          const SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}

Widget globalButton(
  String label, {
  VoidCallback? onPressed,
  bool isEnabled = true,
  double borderRadius = 30,
  Color enabledColor = Colors.black, // ✅ Default hitam
  Color disabledColor = Colors.grey, // ✅ Default disabled abu
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 24,
  ),
}) {
  return ElevatedButton(
    onPressed: isEnabled ? onPressed : null,
    style: ElevatedButton.styleFrom(
      backgroundColor: isEnabled ? enabledColor : disabledColor,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    child: Text(label, style: GoogleFonts.inter(color: Colors.white)),
  );
}

Widget buildCheckbox(
  String text,
  RxBool value, {
  VoidCallback? onSelected,
  bool disabled = false,
  Color? disabledTileColor, // ✅ optional custom tile color if disabled
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Obx(
      () => CheckboxListTile(
        value: value.value,
        onChanged: disabled
            ? null
            : (val) {
                if (val == true) onSelected?.call();
                value.value = val ?? false;
              },
        title: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 12),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: Colors.teal,selectedTileColor: Colors.teal,
        activeColor: Colors.teal,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
  );
}

Widget buttonMenuWorkPermit(
  String label,
  String asset, {
  VoidCallback? onTap,
  double width = double.infinity,
  double height = 150,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              asset,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    ),
  );
}