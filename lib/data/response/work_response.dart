class WorkResponse {
  String message;
  List<WorkData> data;

  WorkResponse({this.message, this.data});

  WorkResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = new List<WorkData>();
      json['data'].forEach((v) {
        data.add(new WorkData.fromJson(v));
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

class WorkData {
  int id;
  String title;
  String description;
  int progress;
  int userId;
  int inspectionId;

  WorkData(
      {this.id,
        this.title,
        this.description,
        this.progress,
        this.userId,
        this.inspectionId});

  WorkData.fromJson(Map<String, dynamic> json) {
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
