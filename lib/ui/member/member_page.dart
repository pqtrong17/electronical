import 'package:electrical/ui/admin/add_work_page.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEMBER PAGE"),
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
                itemBuilder: (context, index) => itemWork(),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemWork(){
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
                    Text("This is title"),
                    SizedBox(
                      height: 8,
                    ),
                    Text("This is description")
                  ],
                ),
              ),
              IconButton(
                onPressed: () => print('UPDATE'),
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
