class EditUserRequest {
  String adress;
  String mail;
  String name;
  String teamId;
  String username;
  String id;

  EditUserRequest(
      {this.adress, this.mail, this.name, this.id, this.teamId, this.username});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adress'] = this.adress;
    data['mail'] = this.mail;
    data['name'] = this.name;
    data['id'] = this.id;
    data['team_id'] = this.teamId;
    data['username'] = this.username;
    return data;
  }
}
