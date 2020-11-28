import 'package:electrical/data/response/user_response.dart';
import 'package:electrical/ui/admin/contract/detail_user_contract.dart';
import 'package:electrical/ui/admin/presenter/detail_user_presenter.dart';
import 'package:electrical/ui/utils.dart';
import 'package:flutter/material.dart';

class DetailUserPage extends StatefulWidget {
  final User user;

  DetailUserPage({this.user});

  @override
  _DetailUserPageState createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> implements UserDetailContract {
  DetailUserPresenter mPresenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = DetailUserPresenter(this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
        Text("Detail user"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item("Name", widget.user.name),
                item("Email", widget.user.mail),
                item("Phone", widget.user.phoneNumber),
                item("Address", widget.user.adress),
                item("Level",
                    widget.user.level == 1 ? "Member" : widget.user.level == 2
                        ? "Owner"
                        : "Admin"),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget item(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(title, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
            ),
            SizedBox(
              height: 8,
            ),
            Text(value),
            SizedBox(
              height: 16,
            ),
          ],
        ),
        title == "Level"?FlatButton(
          child: Icon(Icons.settings),
          onPressed: () {
            showDialog(context: context, builder: (context) {
              int _mIndex = widget.user.level - 1;
              return StatefulBuilder(
                builder: (context, _setState) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12),
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
                                          Text(index == 0 ? "Member" : index == 1 ? "Owner" : "Admin")
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
                          mainAxisAlignment:
                          MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                if(_mIndex+1 != widget.user.level){
                                  Utils.showLoadingDialog(context);
                                  if(_mIndex == 0){
                                    mPresenter.onSetMember(widget.user.id);
                                  }
                                  if(_mIndex == 1){
                                    mPresenter.onSetOwner(widget.user.id);
                                  }
                                  if(_mIndex == 2){
                                    mPresenter.onSetAdmin(widget.user.id);
                                  }
                                }
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
            }
            );
          },
        ) : Container()
      ],
    );
  }

  @override
  void onSetAdminError() {
    // TODO: implement onSetAdminError
  }

  @override
  void onSetAdminSuccess() {
    Navigator.pop(context);
    Navigator.pop(context);
    // TODO: implement onSetAdminSuccess
  }

  @override
  void onSetMemberError() {
    // TODO: implement onSetMemberError
  }

  @override
  void onSetMemberSuccess() {
    // TODO: implement onSetMemberSuccess
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  void onSetOwnerError() {
    // TODO: implement onSetOwnerError
  }

  @override
  void onSetOwnerSuccess() {
    // TODO: implement onSetOwnerSuccess
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
