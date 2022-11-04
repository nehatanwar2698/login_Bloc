// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.userLoginApi,
  });

  UserLoginApi? userLoginApi;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userLoginApi: json["UserLoginAPI"] == null
            ? null
            : UserLoginApi.fromJson(json["UserLoginAPI"]),
      );

  Map<String, dynamic> toJson() => {
        "UserLoginAPI": userLoginApi == null ? null : userLoginApi!.toJson(),
      };
}

class UserLoginApi {
  UserLoginApi({
    this.errorCode,
    this.result,
    this.response,
  });

  String? errorCode;
  String? result;
  List<Response>? response;

  factory UserLoginApi.fromJson(Map<String, dynamic> json) => UserLoginApi(
        errorCode: json["ErrorCode"] == null ? null : json["ErrorCode"],
        result: json["Result"] == null ? null : json["Result"],
        response: json["Response"] == null
            ? null
            : List<Response>.from(
                json["Response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ErrorCode": errorCode == null ? null : errorCode,
        "Result": result == null ? null : result,
        "Response": response == null
            ? null
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.userId,
    this.userName,
    this.designation,
    this.mobileNo,
    this.memberType,
    this.firmName,
    this.dateOfBirth,
    this.dateOfAnniversary,
    this.language,
    this.address,
    this.option,
    this.captchaCode,
    this.otpCode,
    this.profileImage,
  });

  dynamic userId;
  dynamic userName;
  dynamic designation;
  dynamic mobileNo;
  dynamic memberType;
  dynamic firmName;
  dynamic dateOfBirth;
  dynamic dateOfAnniversary;
  dynamic language;
  dynamic address;
  dynamic option;
  String? captchaCode;
  String? otpCode;
  dynamic profileImage;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["UserID"],
        userName: json["UserName"],
        designation: json["Designation"],
        mobileNo: json["MobileNo"],
        memberType: json["MemberType"],
        firmName: json["FirmName"],
        dateOfBirth: json["DateOfBirth"],
        dateOfAnniversary: json["DateOfAnniversary"],
        language: json["Language"],
        address: json["Address"],
        option: json["Option"],
        captchaCode: json["CaptchaCode"] == null ? null : json["CaptchaCode"],
        otpCode: json["OTPCode"] == null ? null : json["OTPCode"],
        profileImage: json["ProfileImage"],
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "UserName": userName,
        "Designation": designation,
        "MobileNo": mobileNo,
        "MemberType": memberType,
        "FirmName": firmName,
        "DateOfBirth": dateOfBirth,
        "DateOfAnniversary": dateOfAnniversary,
        "Language": language,
        "Address": address,
        "Option": option,
        "CaptchaCode": captchaCode == null ? null : captchaCode,
        "OTPCode": otpCode == null ? null : otpCode,
        "ProfileImage": profileImage,
      };
}
