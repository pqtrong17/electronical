import 'package:flutter/material.dart';

class DetailAdminPage extends StatefulWidget {
  @override
  _DetailAdminPageState createState() => _DetailAdminPageState();
}

class _DetailAdminPageState extends State<DetailAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAIL ADMIN PAGE"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text("DETAIL ADMIN"),
        ),
      ),
    );
  }
}
