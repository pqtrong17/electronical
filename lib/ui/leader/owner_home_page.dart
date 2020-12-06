import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/data/response/team_user_response.dart';
import 'package:electrical/ui/admin/add_inspection_page.dart';
import 'package:electrical/ui/admin/detail_admin_page.dart';
import 'package:electrical/ui/leader/contract/owner_contract.dart';
import 'package:electrical/ui/leader/presenter/owner_presenter.dart';
import 'package:electrical/ui/login/login_page.dart';
import 'package:electrical/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerHomePage extends StatefulWidget {
  final String name;

  OwnerHomePage(this.name);

  @override
  _OwnerHomePageState createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage>
    implements OwnerContract {
  OwnerPresenter mPresenter;
  List<InspectionResponse> mWorks;
  bool isNoData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = OwnerPresenter(this);
    mPresenter.onGetWork();
  }

  Future<Null> _onRefresh() async{
    mPresenter.onGetWork();
    return null;
  }
  
  String _getFirstName(String string){
    print("-----------------------");
    int _pos = 0;
    for(int i = 0; i < string.length; i++){
      if(string[i] == " "){
        _pos = i;
      }
    }
    print("SPACING: $_pos");
    return string.substring(_pos, string.length - 1);
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
        title: Text("WELCOME " + _getFirstName(widget.name)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: mWorks != null
              ? ListView.builder(
                  itemBuilder: (context, index) => itemWork(mWorks[index]),
                  itemCount: mWorks.length,
                )
              : isNoData
                  ? Center(
                      child: Text("No work assign for you", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
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
                          color: data.status == 1
                              ? Colors.blue
                              : data.status == 2
                                  ? Colors.red
                                  : Colors.green,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          convertStatus(data.status),
                          style: TextStyle(color: Colors.white),
                        ),
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
  void onGetWorkError(String error) {
    // TODO: implement onGetWorkError
    if (error == "no_data") {
      setState(() {
        isNoData = true;
      });
    }
  }

  @override
  void onGetWorkSuccess(List<InspectionResponse> response) {
    // TODO: implement onGetWorkSuccess
    setState(() {
      mWorks = response;
    });
  }

  @override
  void onGetTeamUserError() {
    // TODO: implement onGetTeamUserError
  }

  @override
  void onGetTeamUserSuccess(TeamUserResponse response) {
    // TODO: implement onGetTeamUserSuccess
  }

  @override
  void onAddError() {
    // TODO: implement onAddError
  }

  @override
  void onAddSuccess() {
    // TODO: implement onAddSuccess
  }
}
