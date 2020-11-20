import 'package:electrical/ui/admin/add_work_page.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:flutter/material.dart';

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST OF USER"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddWorkPage())),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("List of work will be displaying here"),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => itemUser(),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemUser(){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAdminPage()));
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
                    Text("This is username"),
                    SizedBox(
                      height: 8,
                    ),
                    Text("This is description")
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => print('SET'),
                    icon: Icon(Icons.perm_identity),
                  ),
                  IconButton(
                    onPressed: () => print('ADD'),
                    icon: Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
