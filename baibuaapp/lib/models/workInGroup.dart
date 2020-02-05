class WorkInGroup {
  String topic;
  String description;
  String group;
  List<String> createDate;
  List<String> sendDate;
  List<String> updateDate;
  String id;

  WorkInGroup(
      {this.topic,
      this.description,
      this.group,
      this.createDate,
      this.sendDate,
      this.updateDate,
      this.id});

  WorkInGroup.fromJson(Map<String, dynamic> json) {
    topic = json['Topic'];
    description = json['Description'];
    group = json['Group'];
    createDate = json['CreateDate'].cast<String>();
    sendDate = json['SendDate'].cast<String>();
    updateDate = json['UpdateDate'].cast<String>();
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Topic'] = this.topic;
    data['Description'] = this.description;
    data['Group'] = this.group;
    data['CreateDate'] = this.createDate;
    data['SendDate'] = this.sendDate;
    data['UpdateDate'] = this.updateDate;
    data['Id'] = this.id;
    return data;
  }
}
