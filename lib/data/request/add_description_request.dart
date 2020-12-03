class AddDescriptionRequest {
  String description;
  String id;

  AddDescriptionRequest({this.description, this.id});

  AddDescriptionRequest.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}

class WorkDetail {
  int id;
  String title;
  Null description;
  int progress;
  int userId;
  int inspectionId;

  WorkDetail(
      {this.id,
        this.title,
        this.description,
        this.progress,
        this.userId,
        this.inspectionId});

  WorkDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    progress = json['progress'];
    userId = json['user_id'];
    inspectionId = json['inspection_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['progress'] = this.progress;
    data['user_id'] = this.userId;
    data['inspection_id'] = this.inspectionId;
    return data;
  }
}
