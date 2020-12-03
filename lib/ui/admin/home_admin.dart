import 'package:electrical/ui/admin/inspection_page.dart';
import 'package:electrical/ui/admin/users_page.dart';
import 'package:electrical/ui/login/login_page.dart';
import 'package:electrical/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text("Logout"),
            content: Text("Do you want logout?"),
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () async {
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.remove("token");
                  preferences.remove("isLogin");
                  preferences.remove("level");
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                },
              ),
              FlatButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ));
        },
        child: Icon(
          Icons.logout
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Inspection",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: "User"
          )
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
      body: SafeArea(
        child: currentIndex == 0 ? InspectionPage() : UsersPage(),
      ),
    );
  }
}
