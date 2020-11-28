import 'package:electrical/data/response/login_response.dart';
import 'package:electrical/ui/admin/home_admin.dart';
import 'package:electrical/ui/admin/inspection_page.dart';
import 'package:electrical/ui/leader/leader_page.dart';
import 'package:electrical/ui/login/contract/login_contract.dart';
import 'package:electrical/ui/login/presenter/login_presetner.dart';
import 'package:electrical/ui/member/member_page.dart';
import 'package:electrical/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> implements LoginContract {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginPresenter mPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = LoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen App'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Electronical',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        mPresenter.onLogin(
                            nameController.text, passwordController.text);
                        Utils.showLoadingDialog(context);
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }

  @override
  void onLoginError() {
    // TODO: implement onLoginError
  }

  @override
  void onLoginSuccess(LoginResponse response) async {
    // TODO: implement onLoginSuccess
    Navigator.pop(context);
    if(response.message == "user_is_not_exist") {
      Utils.showAlertDialog(context, title: "Login Error", content: "User is not exist!");
    }
    if(response.message == "wrong_password") {
      Utils.showAlertDialog(context, title: "Login Error", content: "Wrong password!");
    }
    if (response.data != null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool("isLogin", true);
      pref.setString("token", response.token);
      pref.setInt("level", response.data.level);
      Navigator.pop(context);
      switch (response.data.level) {
        case 1:
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MemberPage()), (route) => false);
          break;
        case 2:
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LeaderPage()), (route) => false);
          break;
        case 3:
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeAdmin()), (route) => false);
          break;
      }
    }
  }
}
