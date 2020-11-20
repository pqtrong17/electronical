class LoginResponse {
  String message;
  Data data;
  String token;

  LoginResponse({this.message, this.data, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  int id;
  String name;
  String username;
  String password;
  String adress;
  String phoneNumber;
  String gender;
  String mail;
  String socketId;
  int level;
  String createdAt;
  String updatedAt;
  int teamId;
  String permission;

  Data(
      {this.id,
        this.name,
        this.username,
        this.password,
        this.adress,
        this.phoneNumber,
        this.gender,
        this.mail,
        this.socketId,
        this.level,
        this.createdAt,
        this.updatedAt,
        this.teamId,
        this.permission});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    adress = json['adress'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    mail = json['mail'];
    socketId = json['socket_id'];
    level = json['level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamId = json['team_id'];
    permission = json['permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['adress'] = this.adress;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['mail'] = this.mail;
    data['socket_id'] = this.socketId;
    data['level'] = this.level;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['team_id'] = this.teamId;
    data['permission'] = this.permission;
    return data;
  }
}
