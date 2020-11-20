import 'package:flutter/material.dart';

class AddWorkPage extends StatefulWidget {
  @override
  _AddWorkPageState createState() => _AddWorkPageState();
}

class _AddWorkPageState extends State<AddWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD WORK"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text("ADD WORK"),
        ),
      ),
    );
  }
}
