import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils{
void toast(String message) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.yellow,
      fontSize: 20.0,
    );
  }
}