import 'package:electrical/data/request/update_inspection_request.dart';
import 'package:electrical/ui/admin/contract/inspection_contract.dart';
import 'package:electrical/ui/admin/presenter/inspection_presenter.dart';
import 'package:electrical/ui/admin/work_page.dart';
import 'package:electrical/ui/utils.dart';
import 'package:electrical/utils/services_utils.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../data/response/inspection_response.dart';

class DetailAdminPage extends StatefulWidget {
  final InspectionResponse detail;
  final bool isEditable;

  DetailAdminPage({this.detail, this.isEditable});

  @override
  _DetailAdminPageState createState() => _DetailAdminPageState();
}

class _DetailAdminPageState extends State<DetailAdminPage> implements InspectionContract {
  String titleEditing;
  String descriptionEditing;
  DateTime startDateEditing;
  DateTime endDateEditing;
  String locationEditing;
  String conditionEditing;
  int statusEditing;
  String equipmentEditing;
  UpdateInspectionRequest inspectionRequest;
  InspectionPresenter mPresenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inspectionRequest = UpdateInspectionRequest(
      id: widget.detail.id.toString(),
      description: widget.detail.description,
      title: widget.detail.title,
      endDate: widget.detail.endDate,
      equipmentRequire: widget.detail.equipmentRequire,
      lineCondition: widget.detail.lineCondition,
      lineLocation: widget.detail.lineLocation,
      ownerId: widget.detail.ownerId.toString(),
      startDate: widget.detail.startDate,
      teamId: widget.detail.teamId.toString()
    );
    mPresenter = InspectionPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            Text(widget.isEditable ? "EDIT INSPECTION" : "DETAIL INSPECTION"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelShow("Title", titleEditing ?? widget.detail.title,
                  type: "text", onTapEdit: () async {
                String _data = await showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController controller =
                          TextEditingController();
                      return AlertDialog(
                        title: Text(widget.detail.title),
                        content: TextField(
                          controller: controller,
                        ),
                        actions: [
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context, controller.text);
                            },
                          ),
                          FlatButton(
                            child: Text("CANCEL"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    });
                if (_data != null) {
                  setState(() {
                    titleEditing = _data;
                  });
                  inspectionRequest.title = _data;
                }
              }),
              labelShow("Description",
                  descriptionEditing ?? widget.detail.description,
                  onTapEdit: () async {
                String _data = await showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController controller =
                          TextEditingController();
                      return AlertDialog(
                        title: Text(widget.detail.title),
                        content: TextField(
                          controller: controller,
                        ),
                        actions: [
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context, controller.text);
                            },
                          ),
                          FlatButton(
                            child: Text("CANCEL"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    });
                if (_data != null) {
                  setState(() {
                    descriptionEditing = _data;
                  });
                  inspectionRequest.description = _data;
                }
              }),
              labelShow("Started date",
                  ServiceUtils.formatDateStr(startDateEditing != null ? startDateEditing.toIso8601String() : widget.detail.startDate),
                  onTapEdit: () async {
                DateTime _date = await showDatePicker(
                    context: context,
                    initialDate: startDateEditing ?? DateTime.parse(widget.detail.startDate),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime(2099, 1, 1),
                );
                if(_date != null){
                  setState(() {
                    startDateEditing = DateTime.parse(_date.toIso8601String());
                  });
                  inspectionRequest.startDate = _date.toIso8601String();
                }
              }),
              labelShow("End date",
                  ServiceUtils.formatDateStr(endDateEditing != null? endDateEditing.toIso8601String() : widget.detail.endDate), onTapEdit: () async {
                    DateTime _date = await showDatePicker(
                      context: context,
                      initialDate: endDateEditing ?? DateTime.parse(widget.detail.endDate),
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime(2099, 1, 1),
                    );
                    if(_date != null){
                      setState(() {
                        endDateEditing = DateTime.parse(_date.toIso8601String());
                      });
                      inspectionRequest.endDate = _date.toIso8601String();
                    }
                  }),
              labelShow(
                  "Location", locationEditing ?? widget.detail.lineLocation,
                  onTapEdit: () async {
                String _data = await showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController controller =
                          TextEditingController();
                      return AlertDialog(
                        title: Text(widget.detail.title),
                        content: TextField(
                          controller: controller,
                        ),
                        actions: [
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context, controller.text);
                            },
                          ),
                          FlatButton(
                            child: Text("CANCEL"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    });
                if (_data != null) {
                  setState(() {
                    locationEditing = _data;
                  });
                  inspectionRequest.lineLocation = _data;
                }
              }),
              labelShow(
                  "Condition", conditionEditing ?? widget.detail.lineCondition,
                  onTapEdit: () async {
                String _data = await showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController controller =
                          TextEditingController();
                      return AlertDialog(
                        title: Text(widget.detail.title),
                        content: TextField(
                          controller: controller,
                        ),
                        actions: [
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context, controller.text);
                            },
                          ),
                          FlatButton(
                            child: Text("CANCEL"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    });
                if (_data != null) {
                  setState(() {
                    conditionEditing = _data;
                  });
                  inspectionRequest.lineCondition = _data;
                }
              }),
              labelShow("Status", convertStatus(widget.detail.status),
                  isStatus: true, onTapEdit: () async {
                int _data = await showDialog(
                    context: context,
                    builder: (context) {
                      int _status = statusEditing ?? widget.detail.status;
                      return StatefulBuilder(
                        builder: (context, _setState) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Edit status"),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _setState(() {
                                            _status = index + 1;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          child: Row(
                                            children: [
                                              Icon(_status == index + 1
                                                  ? Icons.radio_button_checked
                                                  : Icons.radio_button_off),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(index == 0
                                                  ? "Pending"
                                                  : index == 1
                                                      ? "On going"
                                                      : "Done")
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      )
                                    ],
                                  ),
                                  itemCount: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context, _status);
                                      },
                                      child: Text("OK"),
                                    ),
                                    FlatButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("CANCEL"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                if (_data != null) {
                  setState(() {
                    statusEditing = _data;
                  });
                }
              }),
              labelShow("Equipment Require",
                  equipmentEditing ?? widget.detail.equipmentRequire,
                  onTapEdit: () async {
                String _data = await showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController controller =
                          TextEditingController();
                      return AlertDialog(
                        title: Text(widget.detail.title),
                        content: TextField(
                          controller: controller,
                        ),
                        actions: [
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context, controller.text);
                            },
                          ),
                          FlatButton(
                            child: Text("CANCEL"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    });
                if (_data != null) {
                  setState(() {
                    equipmentEditing = _data;
                  });
                  inspectionRequest.equipmentRequire = _data;
                }
              }),
              !widget.isEditable
                  ? InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WorkPage(widget.detail.id))),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "List work of inspection:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Click to see more",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.list_alt)
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Utils.showLoadingDialog(context);
                        if(statusEditing != widget.detail.status){
                          mPresenter.onUpdateStatus(statusEditing, widget.detail.id);
                        }
                        mPresenter.onUpdateInspection(inspectionRequest);
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
              SizedBox(
                height: 16,
              ),
              Visibility(
                visible: widget.isEditable != null && widget.isEditable,
                child: InkWell(
                  onTap: () {
                    showDialog(context: context, builder: (context)=> AlertDialog(
                      title: Text("Delete inspection"),
                      content: Text("Do you really want to delete this? This is irreversible!", style: TextStyle(
                        color: Colors.red
                      ),),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Utils.showLoadingDialog(context);
                            mPresenter.onDeleteInspection(widget.detail.id);
                          },
                          child: Text("OK"),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("CANCEL"),
                        ),
                      ],
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "DELETE",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String convertStatus(int status) {
    if (status == 1) {
      return "Pending";
    }
    if (status == 2) {
      return "OnGoing";
    }
    return "Done";
  }

  Widget labelShow(String title, String data,
      {bool isStatus, String type, Function onTapEdit}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 12,
            ),
            Visibility(
              visible: widget.isEditable,
              child: InkWell(
                  onTap: () => onTapEdit(),
                  child: Icon(
                    Icons.edit,
                    size: 15,
                  )),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        isStatus == null || !isStatus
            ? Text(
                data,
                style: TextStyle(fontSize: 14),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:
                          colorOfStatus(statusEditing ?? widget.detail.status),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      convertStatus(statusEditing ?? widget.detail.status),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Color colorOfStatus(int status) {
    if (status == 1) {
      return Colors.blue;
    }
    if (status == 2) {
      return Colors.red;
    }
    return Colors.green;
  }

  @override
  void onDeleteInspectionError() {
    // TODO: implement onDeleteInspectionError
    Toast.show("Delete error", context);
  }

  @override
  void onDeleteInspectionSuccess() {
    // TODO: implement onDeleteInspectionSuccess
    Navigator.pop(context);
    Toast.show("Delete success", context);
    Navigator.pop(context, true);
  }

  @override
  void onGetInspectionError() {
    // TODO: implement onGetInspectionError
  }

  @override
  void onGetInspectionSuccess(List<InspectionResponse> response) {
    // TODO: implement onGetInspectionSuccess
  }

  @override
  void onInsertInspectionError() {
    // TODO: implement onInsertInspectionError
  }

  @override
  void onInsertInspectionSuccess() {
    // TODO: implement onInsertInspectionSuccess
  }

  @override
  void onUpdateInspectionError() {
    // TODO: implement onUpdateInspectionError
    Toast.show("Update error", context);
  }

  @override
  void onUpdateInspectionSuccess() {
    // TODO: implement onUpdateInspectionSuccess
    Navigator.pop(context, true);
    Toast.show("Update success", context);
    Navigator.pop(context, true);
  }

  @override
  void onCloseError() {
    // TODO: implement onCloseError
  }

  @override
  void onCloseSuccess() {
    // TODO: implement onCloseSuccess
  }

  @override
  void onReopenError() {
    // TODO: implement onReopenError
  }

  @override
  void onReopenSuccess() {
    // TODO: implement onReopenSuccess
  }
}
