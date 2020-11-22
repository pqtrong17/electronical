import 'package:electrical/ui/admin/work_page.dart';
import 'package:electrical/utils/services_utils.dart';
import 'package:flutter/material.dart';

import '../../data/response/inspection_response.dart';

class DetailAdminPage extends StatefulWidget {
  final InspectionResponse detail;

  DetailAdminPage({this.detail});

  @override
  _DetailAdminPageState createState() => _DetailAdminPageState();
}

class _DetailAdminPageState extends State<DetailAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("DETAIL ADMIN PAGE"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              labelShow("Title", widget.detail.title),
              labelShow("Description", widget.detail.description),
              labelShow("Started date",
                  ServiceUtils.formatDateStr(widget.detail.startDate)),
              labelShow("End date",
                  ServiceUtils.formatDateStr(widget.detail.endDate)),
              labelShow("Location", widget.detail.lineLocation),
              labelShow("Condition", widget.detail.lineCondition),
              labelShow("Status", convertStatus(widget.detail.status)),
              labelShow("Equipment Require", widget.detail.equipmentRequire),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkPage(widget.detail.id))),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "List work of inspection:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Click to see more",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.list_alt)
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              )
            ],
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
      return "OnGoing";
    }
    return "Done";
  }

  Widget labelShow(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          data,
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
