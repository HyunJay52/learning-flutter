import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

class LoginUserModel {
  String inbuzzToken = '';

  // LoginUserModel(
  //   this.inbuzzToken,
  // );

  // singleton pattern
  static final LoginUserModel _instance = LoginUserModel._internal();
  factory LoginUserModel() {
    return _instance;
  }
  LoginUserModel._internal();
}
