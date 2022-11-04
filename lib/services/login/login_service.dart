// import 'dart:convert';

// import 'package:login_bloc/services/post_service.dart';
// import 'package:http/http.dart' as http;

// class LoginService {
//   PostService postService = new PostService();
//   Future getUserLoginDetails(String mobileNo) async {
//     print("api---");

//     var apiUrl =
//         await ('http://sgfabricatordemo.netcarrots.in/SGFabricatorAPI/Service.svc/UserLoginAPI');
//     Map data = {
//       "MobileNo": mobileNo,
//       "DeviceId": "Device001",
//       "OSType": "iOS",
//       "CaptchaCode": "",
//       "OTP": "",
//       "IsLoginFirst": "",
//       "FCMToken": ""
//     };
//     var response= http
//         .post(
//       Uri.parse(apiUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(data),
//     )
//         .then((value) {
//       print("value $value");
//       return value;
//     });
//     return postService.post(apiUrl, body: data, headers: {}).then((value) {
//       print("value $value");
//       return value;
//     });
//   }
// }
