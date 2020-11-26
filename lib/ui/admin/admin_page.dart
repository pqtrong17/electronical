import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/ui/admin/add_inspection_page.dart';
import 'package:electrical/ui/admin/contract/inspection_contract.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:electrical/ui/admin/presenter/inspection_presenter.dart';
import 'package:electrical/ui/utils.dart';
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
            onPressed: () async {
              bool isReload = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddInspectionPage()));
              if(isReload){
                mPresenter.onGetInspection();
              }
            },
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
                      isEditable: false,
                    )));
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
                IntrinsicWidth(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: data.status == 1 ? Colors.blue : data.status == 2 ? Colors.red : Colors.green,
                        ),
                        alignment: Alignment.center,
                        child: Text(convertStatus(data.status), style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              bool isUpdated = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailAdminPage(
                                        detail: data,
                                        isEditable: true,
                                      )));
                              if(isUpdated){
                                mPresenter.onGetInspection();
                              }
                            },
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
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Utils.showLoadingDialog(context);
                                          mPresenter.onDeleteInspection(data.id);
                                        },
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String convertStatus(int status) {
    if (status == 1) {
      return "Pending";
    }
    if (status == 2) {
      return "On Going";
    }
    return "Done";
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
    mPresenter.onGetInspection();
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
