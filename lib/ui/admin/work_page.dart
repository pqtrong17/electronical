import 'package:electrical/data/response/work_response.dart';
import 'package:electrical/ui/admin/contract/work_contract.dart';
import 'package:electrical/ui/admin/presenter/work_presenter.dart';
import 'package:flutter/material.dart';

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
        title: Text("WORK OF INSPECTION", style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
      body: SafeArea(
        child: mWork != null
            ? ListView.builder(
                itemBuilder: (context, index) => itemWork(mWork.data[index]),
                itemCount: mWork.data.length,
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
