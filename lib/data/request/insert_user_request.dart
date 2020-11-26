class InsertUserRequest {
  String adress;
  String gender;
  String level;
  String mail;
  String name;
  String password;
  String phoneNumber;
  String teamId;
  String username;

  InsertUserRequest(
      {this.adress,
        this.gender,
        this.level,
        this.mail,
        this.name,
        this.password,
        this.phoneNumber,
        this.teamId,
        this.username});

  InsertUserRequest.fromJson(Map<String, dynamic> json) {
    adress = json['adress'];
    gender = json['gender'];
    level = json['level'];
    mail = json['mail'];
    name = json['name'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    teamId = json['team_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adress'] = this.adress;
    data['gender'] = this.gender;
    data['level'] = this.level;
    data['mail'] = this.mail;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['team_id'] = this.teamId;
    data['username'] = this.username;
    return data;
  }
}
