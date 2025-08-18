import 'dart:ffi';

import 'package:IT_workout/IT_workout/modules/bmi/bmi.dart';

class PostGetUserModel {
  String? message;
  PostGetUserData? data;

  PostGetUserModel.fromJson(Map<String, dynamic>? json) {
    message = json?["message"];
    if (json?["data"] != null) {
      data = PostGetUserData.fromJson(json?['data']);
    }
  }
}

class PostGetUserData {
  String? name;
  int? tall;
  int? weight;
  String? gender;
  Float? BMI;
  double? target_calories;
  String? reminder;
  int? level_id;
  String? date_of_birth; //  optional, if you want it

  PostGetUserData.fromJson(Map<String, dynamic>? json) {
    name = json?["name"];
    tall = json?["tall"];
    weight = json?["weight"];
    gender = json?["gender"];
    BMI = json?["BMI"];
    target_calories = json?["target_calories"];
    reminder = json?["reminder"];
    level_id = json?["level_id"];
    date_of_birth = json?["date_of_birth"];
    // optional
  }
}
