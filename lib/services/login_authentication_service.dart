import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:login_bloc/Utility/constant.dart';
import 'package:login_bloc/model/UserModel.dart';

class AuthenticationService {
  Future<UserModel> signInWithMobile(
    String mobile,
  ) async {
    Map data = {
      "MobileNo": mobile,
      "DeviceId": "Device001",
      "OSType": "iOS",
      "CaptchaCode": "",
      "OTP": "",
      "IsLoginFirst": "",
      "FCMToken": ""
    };
    print("apii url ${Uri.parse(API_URL)}");
    print("apii data ${json.encode(data)}");
    String response = await rootBundle.loadString('assets/jsonData.json');
    // var jsonResult = json.decode(response);
    var jsonData = UserModel.fromJson(jsonDecode(response));
    print(jsonData);
    return jsonData;
  }
}
