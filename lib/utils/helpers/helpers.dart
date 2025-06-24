import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../values/get_storage_key.dart';

String readStringData(String key) {
  var result = GetStorage().read(key);
  return (result != null) ? result : "";
}

String readToken() {
  var result = GetStorage().read(GetStorageKey.accessToken);
  return (result != null) ? result : "";
}

void removeToken() {
  GetStorage().remove(GetStorageKey.accessToken);
}

String readCheckin() {
  var result = GetStorage().read(GetStorageKey.checkin);
  return (result != null) ? result : "";
}

void removeCheckin() {
  GetStorage().remove(GetStorageKey.checkin);
}

String readIDPerusahaan() {
  var result = GetStorage().read(GetStorageKey.idperusahaan);
  return (result != null) ? result : "";
}

String readIDUser() {
  var result = GetStorage().read(GetStorageKey.iduser);
  return (result != null) ? result : "";
}

void logoutUser() {
  GetStorage().remove(GetStorageKey.idperusahaan);
  GetStorage().remove(GetStorageKey.iduser);
}

String getYearMonthNow() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM');

  String formattedDate = formatter.format(now);

  return formattedDate;
}

String formatDate(String inputDate) {
  // Parse the original string to DateTime
  DateTime date = DateFormat("yyyy-MM-dd").parse(inputDate);

  // Format to desired output
  return DateFormat("dd MMMM yyyy").format(date);
}