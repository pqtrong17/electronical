class SetLevelRequest {
  String adress;
  String createdAt;
  String gender;
  int id;
  int level;
  String mail;
  String name;
  String password;
  String phoneNumber;
  String socketId;
  int teamId;
  String updatedAt;
  String username;

  SetLevelRequest(
      {this.adress,
        this.createdAt,
        this.gender,
        this.id,
        this.level,
        this.mail,
        this.name,
        this.password,
        this.phoneNumber,
        this.socketId,
        this.teamId,
        this.updatedAt,
        this.username});

  SetLevelRequest.fromJson(Map<String, dynamic> json) {
    adress = json['adress'];
    createdAt = json['created_at'];
    gender = json['gender'];
    id = json['id'];
    level = json['level'];
    mail = json['mail'];
    name = json['name'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    socketId = json['socket_id'];
    teamId = json['team_id'];
    updatedAt = json['updated_at'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adress'] = this.adress;
    data['created_at'] = this.createdAt;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['level'] = this.level;
    data['mail'] = this.mail;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['socket_id'] = this.socketId;
    data['team_id'] = this.teamId;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    return data;
  }
}
