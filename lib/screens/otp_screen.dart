import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_number_captcha/flutter_number_captcha.dart';
import 'package:login_bloc/Utility/constant.dart';
import 'package:login_bloc/model/UserModel.dart';
import 'package:login_bloc/screens/home_page.dart';

class OtpScreen extends StatelessWidget {
  UserModel user;

  OtpScreen({super.key, required this.user});
  TextEditingController otpController = TextEditingController();
  TextEditingController captchaCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Otp Screen")),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 30),
                child: Center(
                  child: Text(
                    "Otp Screen",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: otpController,
                  maxLength: 6,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Mobile Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Otp',
                      hintText: 'Please Enter Mobile Number'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: captchaCodeController,
                  maxLength: 4,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter captcha code";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Captcha',
                      hintText: 'Please Enter captch code'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    submitData(user, context);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  submitData(UserModel user, context) {
    if (otpController.text != user.userLoginApi?.response?.first.otpCode) {
      showToast("Please enter valid otp", 1);
    } else if (captchaCodeController.text !=
        user.userLoginApi?.response?.first.captchaCode) {
      showToast("Please enter valid Captcha Code", 1);
    } else {
      print("verifed");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(
                user: user,
              )));
    }
  }
}
