import 'package:electrical/data/request/add_user_request.dart';
import 'package:electrical/data/request/edit_user_request.dart';
import 'package:electrical/data/request/insert_inspection_request.dart';
import 'package:electrical/data/response/owner_response.dart';
import 'package:electrical/data/response/team_response.dart';
import 'package:electrical/data/response/user_response.dart';
import 'package:electrical/ui/admin/contract/add_user_contract.dart';
import 'package:electrical/ui/admin/contract/owner_contract.dart';
import 'package:electrical/ui/admin/presenter/add_user_presenter.dart';
import 'package:electrical/ui/admin/presenter/owner_presenter.dart';
import 'package:electrical/ui/utils.dart';
import 'package:electrical/utils/services_utils.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AddUserPage extends StatefulWidget {
  final bool isUpdate;
  final User user;

  AddUserPage({this.isUpdate, this.user});

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> implements AddUserContract {
  TextEditingController nameController;
  TextEditingController usernameController;
  TextEditingController addressController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController phoneController;
  String gender;
  AddUserPresenter mPresenter;
  List<Team> mTeams;
  Team team;
  AddUserRequest mRequest;
  EditUserRequest mEditRequest;
  int teamId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    usernameController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    mPresenter = AddUserPresenter(this);
    mPresenter.onGetTeams();
    if (widget.isUpdate != null && widget.isUpdate) {
      mEditRequest = EditUserRequest();
      nameController.text = widget.user.name;
      usernameController.text = widget.user.username;
      addressController.text = widget.user.adress;
      emailController.text = widget.user.mail;
      teamId = widget.user.teamId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.isUpdate != null && widget.isUpdate ? "UPDATE USER" : "ADD USER"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: mTeams != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    _Item("Name", controller: nameController),
                    _Item("Username", controller: usernameController),
                    _Item("Address", controller: addressController),
                    _Item("Email", controller: emailController),
                    Visibility(
                        visible: widget.isUpdate == null || !widget.isUpdate,
                        child: _Item("Phone", controller: phoneController)),
                    Visibility(
                        visible: widget.isUpdate == null || !widget.isUpdate,
                        child:
                            _Item("Password", controller: passwordController)),
                    Visibility(
                      visible: widget.isUpdate == null || !widget.isUpdate,
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            InkWell(
                              onTap: () async {
                                int _mIndex =
                                    gender == null || gender == "male" ? 0 : 1;
                                String _data = await showDialog(
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
                                                  "Gender",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) =>
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
                                                                  horizontal:
                                                                      12),
                                                          child: Row(
                                                            children: [
                                                              Icon(_mIndex == index
                                                                  ? Icons
                                                                      .radio_button_checked
                                                                  : Icons
                                                                      .radio_button_off),
                                                              SizedBox(
                                                                width: 12,
                                                              ),
                                                              Text(index == 0
                                                                  ? "Male"
                                                                  : "Female")
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 12,
                                                      )
                                                    ],
                                                  ),
                                                  itemCount: 2,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context,
                                                            _mIndex == 0
                                                                ? "male"
                                                                : "female");
                                                      },
                                                      child: Text("OK"),
                                                    ),
                                                    FlatButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
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
                                    gender = _data;
                                  });
                                }
                              },
                              child: Container(
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
                                          Text(gender != null
                                              ? gender.toUpperCase()
                                              : "Male"),
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Team",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          InkWell(
                            onTap: () async {
                              int _mIndex = 0;
                              for (int i = 0; i < mTeams.length; i++) {
                                if (mTeams[i].id == team.id) {
                                  _mIndex = i;
                                }
                              }
                              Team _data = await showDialog(
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
                                                "Team",
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
                                                            Text(mTeams[index]
                                                                .subarea)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    )
                                                  ],
                                                ),
                                                itemCount: mTeams.length,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context,
                                                          mTeams[_mIndex]);
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
                              if (_data != null) {
                                setState(() {
                                  team = _data;
                                });
                              }
                            },
                            child: Container(
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
                                        Text(team.subarea),
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
                      onTap: () {

                        if (widget.isUpdate != null && widget.isUpdate) {
                          if (nameController.text != "" &&
                              usernameController.text != "" &&
                              addressController.text != "" &&
                              emailController.text != "" &&
                              team != null) {
                            Utils.showLoadingDialog(context);
                            mEditRequest = EditUserRequest();
                            mEditRequest.name = nameController.text;
                            mEditRequest.username = usernameController.text;
                            mEditRequest.adress = addressController.text;
                            mEditRequest.mail = emailController.text;
                            mEditRequest.teamId = team.id.toString();
                            mEditRequest.id = widget.user.id.toString();
                            mPresenter.onUpdateUser(mEditRequest);
                          } else {
                            Utils.showAlertDialog(context,
                                title: "Error",
                                content: "Please fill missing fields!");
                          }
                        } else{
                          if (nameController.text != "" &&
                              usernameController.text != "" &&
                              addressController.text != "" &&
                              emailController.text != "" &&
                              phoneController.text != "" &&
                              passwordController.text != "" &&
                              gender != null &&
                              team != null) {
                            Utils.showLoadingDialog(context);
                            mRequest = AddUserRequest();
                            mRequest.name = nameController.text;
                            mRequest.username = usernameController.text;
                            mRequest.adress = addressController.text;
                            mRequest.mail = emailController.text;
                            mRequest.password = passwordController.text;
                            mRequest.phoneNumber = phoneController.text;
                            mRequest.level = "1";
                            mRequest.gender = gender;
                            mRequest.teamId = team.id.toString();
                            mPresenter.onAddUser(mRequest);
                          } else {
                            Utils.showAlertDialog(context,
                                title: "Error",
                                content: "Please fill missing fields!");
                          }
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
                    ),
                    Visibility(
                      visible: widget.isUpdate != null && widget.isUpdate,
                      child: GestureDetector(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (context) {
                                int _mIndex = widget.user.level - 1;
                                return StatefulBuilder(
                                  builder: (context, _setState) => Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Owners",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
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
                                                        Text(index == 0
                                                            ? "Member"
                                                            : index == 1
                                                            ? "Owner"
                                                            : "Admin")
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
                                                  Navigator.pop(context);
                                                  if (_mIndex + 1 !=
                                                      widget.user.level) {
                                                    Utils.showLoadingDialog(context);
                                                    print('------------------- $_mIndex');
                                                    if (_mIndex == 0) {
                                                      mPresenter
                                                          .onSetMember(widget.user.id);
                                                    }
                                                    if (_mIndex == 1) {
                                                      mPresenter
                                                          .onSetOwner(widget.user.id, widget.user.teamId.toString());
                                                    }
                                                    if (_mIndex == 2) {
                                                      mPresenter
                                                          .onSetAdmin(widget.user.id, widget.user.teamId.toString());
                                                    }
                                                  }
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
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "SET LEVEL",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    widget.isUpdate != null && widget.isUpdate ? GestureDetector(
                      onTap: () {
                        showDialog(context: context, builder: (context)=> AlertDialog(
                          title: Text(widget.user.level == 0 ? "Unban user" :"Ban user"),
                          content: Text(widget.user.level == 0 ? "Do you really want to unban user?" :"Do you really want to ban user?", style: TextStyle(
                              color: Colors.red
                          ),),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Utils.showLoadingDialog(context);
                                if (widget.user.level != 0) {
                                  mPresenter.onBanUser(widget.user.id);
                                }else{
                                  mPresenter.onUnBanUser(widget.user.id);
                                }
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
                            color: widget.user.level == 0 ? Colors.amber :Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          widget.user.level == 0 ? "UNBAN USER" :"BAN USER",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ) : Container()
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget item(String title,
      {TextEditingController controller,
      bool isDate,
      String value,
      Function onTap}) {
    bool _isShowError = false;
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
            onTap: () => onTap != null ? onTap() : null,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: isDate == null || !isDate
                  ? TextField(
                      controller: controller,
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
          ),
          Visibility(
            visible: (isDate != null && isDate) ? false : _isShowError,
            child: Text(
              "This field is required",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }

  Future<int> showStatusDialog() async {
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
  void onGetTeamError() {
    // TODO: implement onAddError
  }

  @override
  void onGetTeamSuccess(TeamResponse response) {
    // TODO: implement onAddSuccess
    setState(() {
      mTeams = response.data;
      team = response.data[0];
    });
    if(widget.isUpdate){
      for(Team item in response.data){
        if(item.id == widget.user.teamId){
          setState(() {
            team = item;
          });
        }
      }
    }
  }

  @override
  void onAddUserError() {
    // TODO: implement onAddUserError
  }

  @override
  void onAddUserSuccess() {
    // TODO: implement onAddUserSuccess
    Navigator.pop(context);
    Navigator.pop(context, true);
  }

  @override
  void onEditError() {
    // TODO: implement onEditError
  }

  @override
  void onEditSuccess() {
    // TODO: implement onEditSuccess
    Navigator.pop(context);
    Navigator.pop(context, true);
  }

  @override
  void onBanError() {
    // TODO: implement onBanError
  }

  @override
  void onBanSuccess() {
    // TODO: implement onBanSuccess
    Toast.show("Ban user success", context);
    Navigator.pop(context);
    Navigator.pop(context, true);
  }

  @override
  void onSetAdminError() {
    // TODO: implement onSetAdminError
  }

  @override
  void onSetAdminSuccess() {
    // TODO: implement onSetAdminSuccess
    Navigator.pop(context);
    Navigator.pop(context, true);
  }

  @override
  void onSetMemberError() {
    // TODO: implement onSetMemberError
  }

  @override
  void onSetMemberSuccess() {
    // TODO: implement onSetMemberSuccess
    Navigator.pop(context);
    Navigator.pop(context, true);
  }

  @override
  void onSetOwnerError(String error) {
    // TODO: implement onSetOwnerError
    Navigator.pop(context);
    Utils.showAlertDialog(context, title: "Error", content: "This team already have an owner");
  }

  @override
  void onSetOwnerSuccess() {
    // TODO: implement onSetOwnerSuccess
    Navigator.pop(context);
    Navigator.pop(context, true);
  }

  @override
  void onUnBanError() {
    // TODO: implement onUnBanError
  }

  @override
  void onUnBanSuccess() {
    // TODO: implement onUnBanSuccess
    Toast.show("Unban user success", context);
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
                obscureText: widget.title == "Password",
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
