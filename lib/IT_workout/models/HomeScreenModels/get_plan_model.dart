class GetPlanModel{
  String? message;
  GetPlanData? data;
  GetPlanModel.fromJson(Map<String,dynamic>?json){
    message = json?["message "];
    data = json?["data "] != null ? GetPlanData.fromJson(json!["data "]) : null;
  }

}
class GetPlanData {
  String? name;
  String? description ;
  int? number_of_day_to_train;

  GetPlanData.fromJson(Map<String,dynamic>?json){
    this.name=json?["name"];
    this.description=json?["description"];
    this.number_of_day_to_train=json?["number_of_day_to_train"];
  }
}