import 'package:electrical/data/response/user_response.dart';
import 'package:electrical/ui/admin/add_inspection_page.dart';
import 'package:electrical/ui/admin/add_user_page.dart';
import 'package:electrical/ui/admin/contract/user_contract.dart';
import 'package:electrical/ui/admin/detai_user_page.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:electrical/ui/admin/presenter/user_presenter.dart';
import 'package:electrical/ui/utils.dart';
import 'package:electrical/utils/services_utils.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> implements UserContract {
  UserPresenter mPresenter;
  UserResponse mUsers;
  bool isOpenDialog = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = UserPresenter(this);
    mPresenter.onGetUsers();
  }

  Future<Null> _onRefresh() async{
    mPresenter.onGetUsers();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USERS"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              bool _isUpdate = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddUserPage()));
              if(_isUpdate){
                setState(() {
                  isOpenDialog = true;
                });
                Utils.showLoadingDialog(context);
                mPresenter.onGetUsers();
              }
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: mUsers != null
              ? ListView.builder(
                  itemBuilder: (context, index) => itemUser(mUsers.data[index]),
                  itemCount: mUsers.data.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Widget itemUser(User user) {
    return InkWell(
      onTap: () async {
        bool isLoad = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailUserPage(
                      user: user,
                    )));
        if (isLoad == true) {
          mPresenter.onGetUsers();
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 8,
                      ),
                      Text(user.mail),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: user.level == 3 ? Colors.red : user.level == 2 ? Colors.blue : user.level == 1 ?  Colors.green : Colors.grey,
                          ),
                          padding: EdgeInsets.all(4),
                          child: Text(user.level == 1 ? "Member" : user.level == 2 ? "Owner" : user.level == 3 ? "Admin" : "Banned", style: TextStyle(
                              color: Colors.white
                          ),)),
                    ],
                  ),
                ),

                InkWell(
                    onTap: () async {
                      bool isLoad = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddUserPage(
                                    isUpdate: true,
                                    user: user,
                                  )));
                      if (isLoad != null && isLoad) {
                        mPresenter.onGetUsers();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                        height: double.infinity,
                        child: Icon(
                          Icons.edit,
                          size: 20,
                        )))
              ],
            ),
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
    if(isOpenDialog){
      Navigator.pop(context);
      setState(() {
        isOpenDialog = false;
      });
    }
    mUsers = UserResponse();
    setState(() {
      mUsers = response;
    });
  }
}
