import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String API_URL =
    'http://sgfabricatordemo.netcarrots.in/SGFabricatorAPI/Service.svc/UserLoginAPI';

showToast(String msg, int time) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: time,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
