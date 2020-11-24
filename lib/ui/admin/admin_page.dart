import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/ui/admin/add_work_page.dart';
import 'package:electrical/ui/admin/contract/inspection_contract.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:electrical/ui/admin/presenter/inspection_presenter.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> implements InspectionContract {
  InspectionPresenter mPresenter;
  List<InspectionResponse> mInspection;
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = InspectionPresenter(this);
    mPresenter.onGetInspection();
    scaffoldKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                      itemBuilder: (context, index) =>
                          itemWork(mInspection[index]),
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailAdminPage(
                      detail: data,
                    )));
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
                    Text(
                      data.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Do you want delete?"),
                                content: Text(
                                    "This action is not reverse. Continue?"),
                                actions: [
                                  FlatButton(
                                    child: Text("OK"),
                                    onPressed: () =>
                                        mPresenter.onDeleteInspection(data.id),
                                  ),
                                  FlatButton(
                                    child: Text("CANCEL"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ));
                    },
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

  @override
  void onDeleteInspectionError() {
    // TODO: implement onDeleteInspectionError
    Toast.show("Delete error", context);
  }

  @override
  void onDeleteInspectionSuccess() {
    // TODO: implement onDeleteInspectionSuccess
    Navigator.pop(context);
    // Toast.show("Delete success", context);
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Delete success!"),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  void onUpdateInspectionError() {
    // TODO: implement onUpdateInspectionError
  }

  @override
  void onUpdateInspectionSuccess() {
    // TODO: implement onUpdateInspectionSuccess
  }

  @override
  void onInsertInspectionError() {
    // TODO: implement onInsertInspectionError
  }

  @override
  void onInsertInspectionSuccess() {
    // TODO: implement onInsertInspectionSuccess
  }
}
