class UserData {
  String nameTH;
  String status;
  int level;
  String faculty;
  String nameEN;
  String id;
  String major;
  String password;
  String email;

  UserData(
      {this.nameTH,
        this.status,
        this.level,
        this.faculty,
        this.nameEN,
        this.id,
        this.major,
        this.password,
        this.email});

  UserData.fromJson(Map<String, dynamic> json) {
    nameTH = json['NameTH'];
    status = json['Status'];
    level = json['Level'];
    faculty = json['Faculty'];
    nameEN = json['NameEN'];
    id = json['Id'];
    major = json['Major'];
    password = json['Password'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NameTH'] = this.nameTH;
    data['Status'] = this.status;
    data['Level'] = this.level;
    data['Faculty'] = this.faculty;
    data['NameEN'] = this.nameEN;
    data['Id'] = this.id;
    data['Major'] = this.major;
    data['Password'] = this.password;
    data['Email'] = this.email;
    return data;
  }
}
