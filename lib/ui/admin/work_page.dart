import 'package:electrical/data/response/work_response.dart';
import 'package:electrical/ui/admin/contract/work_contract.dart';
import 'package:electrical/ui/admin/presenter/work_presenter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class WorkPage extends StatefulWidget {
  final int inspectionId;

  WorkPage(this.inspectionId);

  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> implements WorkContract {
  WorkPresenter mPresenter;
  WorkResponse mWork;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mPresenter = WorkPresenter(this);
    mPresenter.onGetWork(widget.inspectionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "WORKS OF INSPECTION",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: mWork != null
            ? mWork.data != null && mWork.data.length != 0
                ? ListView.builder(
                    itemBuilder: (context, index) =>
                        itemWork(mWork.data[index]),
                    itemCount: mWork.data.length,
                  )
                : Center(
                    child: Text("No data!", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),),
                  )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget itemWork(WorkData data) {
    return InkWell(
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
                      percent: data.progress.toDouble()/100,
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
  void onGetWorkError() {
    // TODO: implement onGetWorkError
  }

  @override
  void onGetWorkSuccess(WorkResponse response) {
    // TODO: implement onGetWorkSuccess
    print("------------------- ${widget.inspectionId}");
    mWork = WorkResponse();
    setState(() {
      mWork = response;
    });
  }
}
