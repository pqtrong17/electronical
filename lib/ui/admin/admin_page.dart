import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/ui/admin/add_work_page.dart';
import 'package:electrical/ui/admin/contract/inspection_contract.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:electrical/ui/admin/presenter/inspection_presenter.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> implements InspectionContract {
  InspectionPresenter mPresenter;
  List<InspectionResponse> mInspection;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = InspectionPresenter(this);
    mPresenter.onGetInspection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADMIN PAGE"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddWorkPage())),
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
            mInspection != null
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => itemWork(mInspection[index]),
                      itemCount: mInspection.length,
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      ),
    );
  }

  Widget itemWork(InspectionResponse data) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailAdminPage()));
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
                    Text(data.title, style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      height: 8,
                    ),
                    Text(data.description)
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => print('UPDATE'),
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () => print('DELETE'),
                    icon: Icon(Icons.delete),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onGetInspectionError() {
    // TODO: implement onGetInspectionError
  }

  @override
  void onGetInspectionSuccess(List<InspectionResponse> response) {
    // TODO: implement onGetInspectionSuccess
    setState(() {
      mInspection = response;
    });
  }
}
