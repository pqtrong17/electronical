import 'package:electrical/ui/admin/inspection_page.dart';
import 'package:electrical/ui/leader/leader_page.dart';
import 'package:electrical/ui/member/member_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InspectionPage())),
                  child: Text("ADMIN")),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LeaderPage())),
                  child: Text("LEADER")),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MemberPage())),
                  child: Text("MEMBER"))
            ],
          ),
        ),
      ),
    );
  }
}
