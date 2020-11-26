class InsertInspectionRequest {
  String description;
  String endDate;
  String equipmentRequire;
  String lineCondition;
  String lineLocation;
  String ownerId;
  String startDate;
  String status;
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
    return data;
  }
}
