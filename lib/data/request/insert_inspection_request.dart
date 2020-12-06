class InsertInspectionRequest {
  String description;
  String endDate;
  String equipmentRequire;
  String lineCondition;
  String lineLocation;
  int ownerId;
  String startDate;
  int status;
  int teamId;
  String title;

  InsertInspectionRequest(
      {this.description,
        this.endDate,
        this.equipmentRequire,
        this.lineCondition,
        this.lineLocation,
        this.ownerId,
        this.startDate,
        this.status,
        this.teamId,
        this.title});

  InsertInspectionRequest.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    endDate = json['end_date'];
    equipmentRequire = json['equipment_require'];
    lineCondition = json['line_condition'];
    lineLocation = json['line_location'];
    ownerId = json['owner_id'];
    startDate = json['start_date'];
    status = json['status'];
    title = json['title'];
    teamId = json['team_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['end_date'] = this.endDate;
    data['equipment_require'] = this.equipmentRequire;
    data['line_condition'] = this.lineCondition;
    data['line_location'] = this.lineLocation;
    data['owner_id'] = this.ownerId;
    data['start_date'] = this.startDate;
    data['status'] = this.status;
    data['title'] = this.title;
    data['team_id'] = this.teamId;
    return data;
  }
}
