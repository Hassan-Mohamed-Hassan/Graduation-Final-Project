class AddSubjectNewModel{
  List<AddSubjectNew>? subjectNew;
  AddSubjectNewModel.fromjson(Map<String,dynamic>json){
    if (json['subjectNew'] != null) {
      subjectNew = <AddSubjectNew>[];
      json['subjectNew'].forEach((v) {
        subjectNew!.add(new AddSubjectNew.fromjson(v));
      });
    }

  }


}
class AddSubjectNew{
  int? id;
  String? name;
  AddSubjectNew.fromjson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
  }
}