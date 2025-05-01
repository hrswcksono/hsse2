import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helpers/helpers.dart';
import '../routes/app_pages.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (readToken() != "") {
      return const RouteSettings(name: Routes.HOME);
    }
    return null;
  }
}
