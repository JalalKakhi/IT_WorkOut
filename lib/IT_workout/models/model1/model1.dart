import 'package:IT_workout/IT_workout/models/baseModel/base_model.dart';

class Model1 extends BaseModel{
  String? status;
  int? totalResults;
  List<article> results=[];

  @override
  void formJason(dynamic response) {
    this.status=response["status"];
    this.totalResults=response["totalResults"];
    if(response["results"]!=null && response["results"].isNotEmpty){
      response["results"].forEach((item){
        var art=article.fromjason(item);
        this.results.add(art);
      });
    }

  }

}
class article{
  String? title;
  String? link;
  article.fromjason(Map<String,dynamic> jason){
    this.title=jason["title"];
    this.link=jason["link"];
  }
}