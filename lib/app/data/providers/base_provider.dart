import 'package:get/get.dart';

import '../../../utils/helpers/helpers.dart';
import '../../../utils/values/string_const.dart';

class BaseProvider extends GetConnect {
  /// Documentation for seeting config for getconnect to connec t api the other
  /// > * _`@param: [T]`_ - paramName
  ///
  /// > _`@returns: [T]`_
  @override
  void onInit() {
    httpClient.baseUrl = StringConst.baseUrl;

    httpClient.timeout = const Duration(seconds: 1000);

    // print(idperusahaan);
    // print(iduser);

    var accessToken = readToken();

    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      request.headers['access_token'] = accessToken;
      return request;
    });

    super.onInit();
  }
}
