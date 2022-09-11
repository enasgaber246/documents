class NewResModel {
  NewResModel({
      this.success, 
      this.recid, 
      this.recno,});

  NewResModel.fromJson(dynamic json) {
    success = json['success'];
    recid = json['recid'];
    recno = json['recno'];
  }
  bool? success;
  int? recid;
  String? recno;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['recid'] = recid;
    map['recno'] = recno;
    return map;
  }

}