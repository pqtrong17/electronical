class InspectionResponse {
  int id;
  String title;
  int status;
  String lineLocation;
  String lineCondition;
  String description;
  String equipmentRequire;
  String startDate;
  String endDate;
  String createdAt;
  String updatedAt;
  int teamId;
  int ownerId;

  InspectionResponse(
      {this.id,
        this.title,
        this.status,
        this.lineLocation,
        this.lineCondition,
        this.description,
        this.equipmentRequire,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.teamId,
        this.ownerId});

  InspectionResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    lineLocation = json['line_location'];
    lineCondition = json['line_condition'];
    description = json['description'];
    equipmentRequire = json['equipment_require'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamId = json['team_id'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['line_location'] = this.lineLocation;
    data['line_condition'] = this.lineCondition;
    data['description'] = this.description;
    data['equipment_require'] = this.equipmentRequire;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['team_id'] = this.teamId;
    data['owner_id'] = this.ownerId;
    return data;
  }
}
