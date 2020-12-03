class TeamResponse {
  String message;
  List<Team> data;

  TeamResponse({this.message, this.data});

  TeamResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Team>();
      json['data'].forEach((v) {
        data.add(new Team.fromJson(v));
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

class Team {
  int id;
  String subarea;
  int divisionId;

  Team({this.id, this.subarea, this.divisionId});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subarea = json['subarea'];
    divisionId = json['division_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subarea'] = this.subarea;
    data['division_id'] = this.divisionId;
    return data;
  }
}
