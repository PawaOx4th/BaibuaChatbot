class UserData {
  String email;
  String nameTH;
  String status;
  String degree;
  int level;
  String faculty;
  String nameEN;
  String id;
  String major;
  String password;

  UserData(
      {this.email,
        this.nameTH,
        this.status,
        this.degree,
        this.level,
        this.faculty,
        this.nameEN,
        this.id,
        this.major,
        this.password});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    nameTH = json['NameTH'];
    status = json['Status'];
    degree = json['Degree'];
    level = json['Level'];
    faculty = json['Faculty'];
    nameEN = json['NameEN'];
    id = json['Id'];
    major = json['Major'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['NameTH'] = this.nameTH;
    data['Status'] = this.status;
    data['Degree'] = this.degree;
    data['Level'] = this.level;
    data['Faculty'] = this.faculty;
    data['NameEN'] = this.nameEN;
    data['Id'] = this.id;
    data['Major'] = this.major;
    data['Password'] = this.password;
    return data;
  }
}
