import 'package:electrical/data/response/inspection_response.dart';
import 'package:electrical/data/response/work_response.dart';
import 'package:electrical/ui/admin/contract/work_contract.dart';
import 'package:electrical/ui/admin/presenter/work_presenter.dart';
import 'package:electrical/ui/leader/add_work_page.dart';
import 'package:electrical/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:seekbar/seekbar.dart';
import 'package:toast/toast.dart';
class WorkPage extends StatefulWidget {
  final int inspectionId;
  final bool isDone;

  WorkPage(this.inspectionId, this.isDone);

  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> implements WorkContract {
  WorkPresenter mPresenter;
  WorkResponse mWork;
  InspectionResponse inspection;
  double progress;

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
        actions: [
          !widget.isDone ? IconButton(
            onPressed: () async {
              bool isReload = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddWorkPage(inspectionId: widget.inspectionId)));
              if(isReload){
                mPresenter.onGetWork(widget.inspectionId);
              }
            },
            icon: Icon(Icons.add),
          ) : Container()
        ],
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
      onTap: () {
        setState(() {
          progress = data.progress.toDouble()/100;
        });
        showDialog(context: context, builder: (context)=> Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text("Update progress".toUpperCase(), style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Text("Progress:"),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: SeekBar(
                    barColor: Colors.grey,
                    progressColor: Colors.green,
                    thumbColor: Colors.blue,
                    onProgressChanged: (value){
                      setState(() {
                        progress = double.parse(value.toStringAsFixed(1));
                      });
                      Toast.show((progress * 100).toString() + "%", context);
                    },
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Utils.showLoadingDialog(context);
                        print("------------------ ${progress * 100} --- $progress");
                        mPresenter.onUpdateProgress(data.id, (progress*100).toString());
                      },
                      child: Text("OK"),
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("CANCEL"),
                    )
                  ],
                )
              ],
            ),
          ),
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

  @override
  void onUpdateProgressError() {
    // TODO: implement onUpdateProgressError
  }

  @override
  void onUpdateProgressSuccess() {
    // TODO: implement onUpdateProgressSuccess
    Navigator.pop(context);
    mPresenter.onGetWork(widget.inspectionId);
  }
}
