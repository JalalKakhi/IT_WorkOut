class GetPlanModel {
  String? message;
  List<GetPlanData> data = [];

  GetPlanModel.fromJson(Map<String, dynamic>? json) {
    message = json?["message"];
    if (json?["data"] != null) {
      json?["data"].forEach((plan) {
        data.add(GetPlanData.fromJson(plan));
      });
    }
  }
}

class GetPlanData {
  String? name;
  String? description;
  int? numberOfDayToTrain;
  int? levelId; // optional, if you want it

  GetPlanData.fromJson(Map<String, dynamic>? json) {
    name = json?["name"];
    description = json?["description"];
    numberOfDayToTrain = json?["number_of_day_to_train"];
    levelId = json?["level_id"]; // optional
  }
}
