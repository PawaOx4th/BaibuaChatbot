class GroupModel {
  String id;
  Sec sec;

  GroupModel({this.id, this.sec});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    sec = json['Sec'] != null ? new Sec.fromJson(json['Sec']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    if (this.sec != null) {
      data['Sec'] = this.sec.toJson();
    }
    return data;
  }
}

class Sec {
  int sec;
  List<String> createDate;
  List<String> updateDate;
  String id;
  String subject;
  int status;

  Sec(
      {this.sec,
      this.createDate,
      this.updateDate,
      this.id,
      this.subject,
      this.status});

  Sec.fromJson(Map<String, dynamic> json) {
    sec = json['Sec'];
    createDate = json['CreateDate'].cast<String>();
    updateDate = json['UpdateDate'].cast<String>();
    id = json['Id'];
    subject = json['Subject'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sec'] = this.sec;
    data['CreateDate'] = this.createDate;
    data['UpdateDate'] = this.updateDate;
    data['Id'] = this.id;
    data['Subject'] = this.subject;
    data['Status'] = this.status;
    return data;
  }
}
