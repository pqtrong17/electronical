import 'package:electrical/data/request/add_description_request.dart';
import 'package:electrical/data/response/work_response.dart';
import 'package:electrical/ui/admin/add_inspection_page.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:electrical/ui/login/login_page.dart';
import 'package:electrical/ui/member/contract/member_contract.dart';
import 'package:electrical/ui/member/presenter/member_presenter.dart';
import 'package:electrical/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> implements MemberContract {
  MemberPresenter mPresenter;
  WorkResponse mWorks;
  AddDescriptionRequest mRequest;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = MemberPresenter(this);
    mPresenter.onGetWorks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Logout"),
                    content: Text("Do you want logout?"),
                    actions: [
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.remove("token");
                          preferences.remove("isLogin");
                          preferences.remove("level");
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        },
                      ),
                      FlatButton(
                        child: Text("Cancel"),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ));
        },
        child: Icon(Icons.logout),
      ),
      appBar: AppBar(
        title: Text("MEMBER PAGE"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: mWorks != null
            ? ListView.builder(
                itemBuilder: (context, index) => itemWork(mWorks.data[index]),
                itemCount: mWorks.data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget itemWork(WorkData data) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text("Add description"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              isDense: true
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                if (controller.text != "") {
                  Utils.showLoadingDialog(context);
                  mRequest = AddDescriptionRequest();
                  mRequest.id = data.id.toString();
                  mRequest.description = controller.text;
                  mPresenter.onAdd(mRequest);
                }
              },
              child: Text("OK"),
            ),
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("CANCEL"),
            )
          ],
        ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
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
                      Text(data.description ?? "(No description)")
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 10,
                      percent: data.progress.toDouble() / 100,
                      progressColor: Colors.green,
                    ),
                    Text(data.progress.toString() + "%")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onAddError() {
    // TODO: implement onAddError
  }

  @override
  void onAddSuccess() {
    // TODO: implement onAddSuccess
    Navigator.pop(context);
    Toast.show("Success", context);
  }

  @override
  void onGetError() {
    // TODO: implement onGetError
  }

  @override
  void onGetSuccess(WorkResponse response) {
    // TODO: implement onGetSuccess
    setState(() {
      mWorks = response;
    });
  }
}
