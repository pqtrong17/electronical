import 'package:electrical/data/request/add_work_request.dart';
import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/data/response/team_user_response.dart';
import 'package:electrical/ui/leader/contract/owner_contract.dart';
import 'package:electrical/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:electrical/ui/leader/presenter/owner_presenter.dart';

class AddWorkPage extends StatefulWidget {
  final int inspectionId;

  AddWorkPage({this.inspectionId});

  @override
  _AddWorkPageState createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> implements OwnerContract {
  TextEditingController titleController = TextEditingController();
  TeamUserResponse mTeamUser;
  OwnerPresenter mPresenter;
  TeamUser teamUser;
  AddWorkRequest mRequest = AddWorkRequest();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = OwnerPresenter(this);
    mPresenter.onGetTeamUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add work"),
      ),
      body: mTeamUser != null
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Item(
                  "Title",
                  controller: titleController,
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          "Assign for",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          int _mIndex = 0;
                          for(int i = 0; i < mTeamUser.data.length; i++){
                            if(teamUser.id == mTeamUser.data[i].id){
                              _mIndex = i;
                            }
                          }
                          TeamUser _data = await showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, _setState) => Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Members",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        _setState(() {
                                                          _mIndex = index;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 8,
                                                            horizontal: 12),
                                                        child: Row(
                                                          children: [
                                                            Icon(_mIndex ==
                                                                index
                                                                ? Icons
                                                                .radio_button_checked
                                                                : Icons
                                                                .radio_button_off),
                                                            SizedBox(
                                                              width: 12,
                                                            ),
                                                            Text(mTeamUser.data[index].name)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    )
                                                  ],
                                                ),
                                            itemCount: mTeamUser.data.length,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              FlatButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context,
                                                      mTeamUser.data[_mIndex]);
                                                },
                                                child: Text("OK"),
                                              ),
                                              FlatButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
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
                          // if (_data != null) {
                          //   setState(() {
                          //     owner = _data;
                          //   });
                          // }
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(teamUser.name),
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
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (titleController.text != "") {
                      Utils.showLoadingDialog(context);
                      mRequest.inspectionId = widget.inspectionId.toString();
                      mRequest.title = titleController.text;
                      mRequest.userId = teamUser.id.toString();
                      mPresenter.onAddWork(mRequest);
                    }else{
                      Utils.showAlertDialog(context,
                          title: "Error",
                          content: "Please fill missing fields!");
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    margin:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void onGetTeamUserError() {
    // TODO: implement onGetTeamUserError
  }

  @override
  void onGetTeamUserSuccess(TeamUserResponse response) {
    // TODO: implement onGetTeamUserSuccess
    setState(() {
      mTeamUser = response;
      teamUser = response.data[0];
    });
  }

  @override
  void onGetWorkError(String error) {
    // TODO: implement onGetWorkError
  }

  @override
  void onGetWorkSuccess(List<InspectionResponse> response) {
    // TODO: implement onGetWorkSuccess
  }

  @override
  void onAddError() {
    // TODO: implement onAddError
  }

  @override
  void onAddSuccess() {
    // TODO: implement onAddSuccess
    Navigator.pop(context);
    Navigator.pop(context, true);
  }
}

class _Item extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool isDate;
  final String value;
  final Function onTap;

  _Item(this.title, {this.controller, this.isDate, this.value, this.onTap});

  @override
  __ItemState createState() => __ItemState();
}

class __ItemState extends State<_Item> {
  bool _isShowError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: () => widget.onTap != null ? widget.onTap() : null,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: widget.isDate == null || !widget.isDate
                  ? TextField(
                      controller: widget.controller,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none)),
                      onChanged: (value) {
                        setState(() {
                          if (value != "") {
                            _isShowError = false;
                          } else {
                            _isShowError = true;
                          }
                        });
                      },
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(widget.value),
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
          ),
          SizedBox(
            height: 4,
          ),
          Visibility(
            visible:
                (widget.isDate != null && widget.isDate) ? false : _isShowError,
            child: Text(
              "This field is required",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
