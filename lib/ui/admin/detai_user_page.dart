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

class _DetailUserPageState extends State<DetailUserPage>
    implements UserDetailContract {
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
        title: Text("Detail user"),
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
                item(
                    "Level",
                    widget.user.level == 1
                        ? "Member"
                        : widget.user.level == 2
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
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
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
