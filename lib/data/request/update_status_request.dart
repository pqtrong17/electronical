class UpdateStatusRequest {
  String createdAt;
  String description;
  String endDate;
  String equipmentRequire;
  int id;
  String lineCondition;
  String lineLocation;
  int ownerId;
  String startDate;
  int status;
  int teamId;
  String title;
  String updatedAt;

  UpdateStatusRequest(
      {this.createdAt,
        this.description,
        this.endDate,
        this.equipmentRequire,
        this.id,
        this.lineCondition,
        this.lineLocation,
        this.ownerId,
        this.startDate,
        this.status,
        this.teamId,
        this.title,
        this.updatedAt});

  UpdateStatusRequest.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    description = json['description'];
    endDate = json['end_date'];
    equipmentRequire = json['equipment_require'];
    id = json['id'];
    lineCondition = json['line_condition'];
    lineLocation = json['line_location'];
    ownerId = json['owner_id'];
    startDate = json['start_date'];
    status = json['status'];
    teamId = json['team_id'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['end_date'] = this.endDate;
    data['equipment_require'] = this.equipmentRequire;
    data['id'] = this.id;
    data['line_condition'] = this.lineCondition;
    data['line_location'] = this.lineLocation;
    data['owner_id'] = this.ownerId;
    data['start_date'] = this.startDate;
    data['status'] = this.status;
    data['team_id'] = this.teamId;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
