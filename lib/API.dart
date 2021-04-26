import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> fetch() async {
  var url = 'https://api.instabuy.com.br/apiv3/layout?subdomain=bigboxdelivery';
  await http.get(url);
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return json;
}
