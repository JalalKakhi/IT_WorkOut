class GetCategoriesModel {
  String? message;
  List<GetCategoriesData> data = [];

  GetCategoriesModel.fromJson(Map<String, dynamic>? json) {
    message = json?["message"];
    if (json?["data"] != null) {
      json?["data"].forEach((plan) {
        data.add(GetCategoriesData.fromJson(plan));
      });
    }
  }
}

class GetCategoriesData {
  int? id;
  String? name;
  String? description;
  String? image_path;
  // optional, if you want it

  GetCategoriesData.fromJson(Map<String, dynamic>? json) {
    id = json?["id"];
    name = json?["name"];
    description = json?["description"];
    image_path = json?["image_path"];
     // optional
  }
}
