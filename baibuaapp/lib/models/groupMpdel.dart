class GroupModel {
  String id;
  Sec sec;
  String teacher1;

  GroupModel({this.id, this.sec, this.teacher1});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    sec = json['Sec'] != null ? new Sec.fromJson(json['Sec']) : null;
    teacher1 = json['Teacher1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    if (this.sec != null) {
      data['Sec'] = this.sec.toJson();
    }
    data['Teacher1'] = this.teacher1;
    return data;
  }
}

class Sec {
  List<String> createDate;
  List<String> updateDate;
  String id;
  String subject;
  int status;
  int sec;

  Sec(
      {this.createDate,
      this.updateDate,
      this.id,
      this.subject,
      this.status,
      this.sec});

  Sec.fromJson(Map<String, dynamic> json) {
    createDate = json['CreateDate'].cast<String>();
    updateDate = json['UpdateDate'].cast<String>();
    id = json['Id'];
    subject = json['Subject'];
    status = json['Status'];
    sec = json['Sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CreateDate'] = this.createDate;
    data['UpdateDate'] = this.updateDate;
    data['Id'] = this.id;
    data['Subject'] = this.subject;
    data['Status'] = this.status;
    data['Sec'] = this.sec;
    return data;
  }
}
