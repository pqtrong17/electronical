import 'package:electrical/data/request/insert_inspection_request.dart';
import 'package:electrical/data/response/owner_response.dart';
import 'package:electrical/ui/admin/contract/owner_contract.dart';
import 'package:electrical/ui/admin/presenter/owner_presenter.dart';
import 'package:electrical/ui/utils.dart';
import 'package:electrical/utils/services_utils.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AddInspectionPage extends StatefulWidget {
  @override
  _AddInspectionPageState createState() => _AddInspectionPageState();
}

class _AddInspectionPageState extends State<AddInspectionPage> implements InsertInspectionContract {
  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController conditionController;
  TextEditingController locationController;
  TextEditingController equipmentController;
  DateTime startDate;
  DateTime endDate;
  InsertInspectionPresenter mPresenter;
  OwnerResponse mOwner;
  Owner owner;
  InsertInspectionRequest mRequest;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    conditionController = TextEditingController();
    locationController = TextEditingController();
    equipmentController = TextEditingController();
    mPresenter = InsertInspectionPresenter(this);
    mPresenter.onGetAllOwner();
    mRequest = InsertInspectionRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("ADD INSPECTION"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: mOwner != null ? SingleChildScrollView(
          child: Column(
            children: [
              item("Title", controller: titleController),
              item("Description", controller: descriptionController),
              item("Condition", controller: conditionController),
              item("Location", controller: locationController),
              item("Equipment required", controller: equipmentController),
              item("Start date", isDate: true, value: ServiceUtils.formatDateStr(startDate != null ? startDate.toIso8601String() : DateTime.now().toIso8601String()), onTap: () async {
                DateTime _date = await showDatePicker(
                  context: context,
                  initialDate: startDate ?? DateTime.now(),
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime(2099, 1, 1),
                );
                if(_date != null){
                  setState(() {
                    startDate = _date;
                  });
                }
              }),
              item("End date", isDate: true, value: ServiceUtils.formatDateStr(endDate != null ? endDate.toIso8601String() : DateTime.now().toIso8601String()), onTap: () async {
                DateTime _date = await showDatePicker(
                  context: context,
                  initialDate: endDate ?? DateTime.now(),
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime(2099, 1, 1),
                );
                if(_date != null){
                  setState(() {
                    endDate = _date;
                  });
                }
              }),
              Container(
                margin: EdgeInsets.only(top: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Owner",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    InkWell(
                      onTap: () async {
                        int _mIndex = 0;
                        Owner _data = await showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, _setState) => Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Owners", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) => Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _setState(() {
                                                    _mIndex = index;
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 8, horizontal: 12),
                                                  child: Row(
                                                    children: [
                                                      Icon(_mIndex == index
                                                          ? Icons.radio_button_checked
                                                          : Icons.radio_button_off),
                                                      SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(mOwner.data[index].owner.name)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              )
                                            ],
                                          ),
                                          itemCount: mOwner.data.length,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context, mOwner.data[_mIndex].owner);
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
                            owner = _data;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(owner != null ? owner.name : "Click to choose Owner"),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Utils.showLoadingDialog(context);
                  mRequest.title = titleController.text;
                  mRequest.description = descriptionController.text;
                  mRequest.lineCondition = conditionController.text;
                  mRequest.lineLocation = locationController.text;
                  mRequest.equipmentRequire = equipmentController.text;
                  mRequest.status = 1.toString();
                  mRequest.ownerId = owner.id.toString();
                  mRequest.startDate = ServiceUtils.formatDateYMD(startDate.toIso8601String());
                  mRequest.endDate = ServiceUtils.formatDateYMD(endDate.toIso8601String());
                  mPresenter.onInsertInspection(mRequest);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ) : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget item(String title, {TextEditingController controller, bool isDate, String value, Function onTap}) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: () => onTap(),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: isDate == null || !isDate ? TextField(
                controller: controller,
                decoration: InputDecoration(
                    isCollapsed: true,
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none)),
              ) :
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(value),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<int> showStatusDialog() async{
    int _data = await showDialog(
        context: context,
        builder: (context) {
          int _status;
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
    return _data;
  }

  @override
  void onGetOwnerError() {
    // TODO: implement onGetOwnerError
  }

  @override
  void onGetOwnerSuccess(OwnerResponse response) {
    // TODO: implement onGetOwnerSuccess
    setState(() {
      mOwner = response;
    });
  }

  @override
  void onInsertError() {
    // TODO: implement onInsertError
    Toast.show("Error. Try again!", context);
  }

  @override
  void onInsertSuccess() {
    // TODO: implement onInsertSuccess
    Navigator.pop(context);
    Toast.show("Success", context);
    Navigator.pop(context, true);
  }

}
