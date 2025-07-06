import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({
    super.key,
    required this.pTitle,
    required this.pBgColor,
    this.pBackButton,
    this.pCenterTitle,
    this.pWidgets,
    this.onBack, // ✅ tambahkan
  });

  final String pTitle;
  final Color pBgColor;
  final bool? pBackButton;
  final bool? pCenterTitle;
  final List<Widget>? pWidgets;
  final VoidCallback? onBack; // ✅ tambahan

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          (pBackButton ?? true)
              ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: onBack ?? () => Get.back(), // ✅ gunakan callback
              )
              : const SizedBox(),
      title: Text(
        pTitle,
        style: GoogleFonts.poppins(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: pBgColor,
      centerTitle: pCenterTitle ?? false,
      actions: pWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
