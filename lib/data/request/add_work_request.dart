class AddWorkRequest {
  String inspectionId;
  String title;
  String userId;

  AddWorkRequest({this.inspectionId, this.title, this.userId});

  AddWorkRequest.fromJson(Map<String, dynamic> json) {
    inspectionId = json['inspection_id'];
    title = json['title'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inspection_id'] = this.inspectionId;
    data['title'] = this.title;
    data['user_id'] = this.userId;
    return data;
  }
}
