import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/utils/values/colors.dart';

import '../controllers/safety_brief_form_controller.dart';

class SafetyBriefFormView extends GetView<SafetyBriefFormController> {
  const SafetyBriefFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Safety Briefing Form",
        pBgColor: CustomColor.appBarColor,
      ),
      body: const Center(
        child: Text(
          'SafetyBriefFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
