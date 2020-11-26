class OwnerResponse {
  String message;
  List<Data> data;

  OwnerResponse({this.message, this.data});

  OwnerResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int userId;
  Owner owner;

  Data({this.id, this.userId, this.owner});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    return data;
  }
}

class Owner {
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

  Owner(
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

  Owner.fromJson(Map<String, dynamic> json) {
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
