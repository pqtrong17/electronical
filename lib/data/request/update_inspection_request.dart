class UpdateInspectionRequest {
  String description;
  String endDate;
  String equipmentRequire;
  String id;
  String lineCondition;
  String lineLocation;
  String ownerId;
  String startDate;
  String teamId;
  String title;

  UpdateInspectionRequest(
      {this.description,
        this.endDate,
        this.equipmentRequire,
        this.id,
        this.lineCondition,
        this.lineLocation,
        this.ownerId,
        this.startDate,
        this.teamId,
        this.title});

  UpdateInspectionRequest.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    endDate = json['end_date'];
    equipmentRequire = json['equipment_require'];
    id = json['id'];
    lineCondition = json['line_condition'];
    lineLocation = json['line_location'];
    ownerId = json['owner_id'];
    startDate = json['start_date'];
    teamId = json['team_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['end_date'] = this.endDate;
    data['equipment_require'] = this.equipmentRequire;
    data['id'] = this.id;
    data['line_condition'] = this.lineCondition;
    data['line_location'] = this.lineLocation;
    data['owner_id'] = this.ownerId;
    data['start_date'] = this.startDate;
    data['team_id'] = this.teamId;
    data['title'] = this.title;
    return data;
  }
}
