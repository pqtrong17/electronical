import 'package:electrical/data/response/user_response.dart';
import 'package:electrical/ui/admin/add_inspection_page.dart';
import 'package:electrical/ui/admin/contract/user_contract.dart';
import 'package:electrical/ui/admin/detai_user_page.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:electrical/ui/admin/presenter/user_presenter.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> implements UserContract {
  UserPresenter mPresenter;
  UserResponse mUsers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = UserPresenter(this);
    mPresenter.onGetUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USERS"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddInspectionPage())),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: mUsers != null
            ? ListView.builder(
                itemBuilder: (context, index) => itemUser(mUsers.data[index]),
                itemCount: mUsers.data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget itemUser(User user) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailUserPage(user: user,)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name),
                    SizedBox(
                      height: 8,
                    ),
                    Text(user.mail)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onGetUserError() {
    // TODO: implement onGetUserError
  }

  @override
  void onGetUserSuccess(UserResponse response) {
    // TODO: implement onGetUserSuccess
    mUsers = UserResponse();
    setState(() {
      mUsers = response;
    });
  }
}
