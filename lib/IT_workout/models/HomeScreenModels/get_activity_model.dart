import 'dart:ffi';
import 'package:IT_workout/IT_workout/modules/bmi/bmi.dart';

class GetActivityModel {
  String? message;
  GetActivityData? data;

  GetActivityModel.fromJson(Map<String, dynamic>? json) {
    message = json?["message"];
    if (json?["data"] != null) {
      data = GetActivityData.fromJson(json?['data']);
    }
  }
}

class GetActivityData {
  int? total_calories_burned_in_day;
  Float? BMI;
  int? target_calories;
//  optional, if you want it

  GetActivityData.fromJson(Map<String, dynamic>? json) {
    BMI = json?["BMI"];
    target_calories = json?["target_calories"];
    total_calories_burned_in_day = json?['total_calories_burned_in_day'];
    // optional
  }
}
