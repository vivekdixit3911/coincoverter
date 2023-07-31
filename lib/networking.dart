// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:http/http.dart';

class networkingsolution {
  final validurl;
  networkingsolution(this.validurl);
  Future fetchdata() async {
    var url = Uri.parse(validurl);
    var url2 = await get(url);
    if (url2.statusCode == 200) {
      return jsonDecode(url2.body);
    }
  }
}
