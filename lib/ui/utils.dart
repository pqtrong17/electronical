
import 'package:flutter/material.dart';

class Utils {
  static void showLoadingDialog(BuildContext context){
    showDialog(context: context, builder: (context) => LoadingDialog(), barrierDismissible: false);
  }

  static void showAlertDialog(BuildContext context,
      {String title, String content}){
    showDialog(context: context, builder: (context) => _AlertDialog(title: title, content: content,), barrierDismissible: false);
  }
}

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
            SizedBox(
            height: 8,
            ),
            Text("Please waiting for load...")
          ],
        ),
      ),
    );
  }
}

class _AlertDialog extends StatelessWidget {
  final String title;
  final String content;

  _AlertDialog({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? "Title"),
     content: Text(content ?? "Content"),
     actions: [
       FlatButton(
         onPressed: () => Navigator.pop(context),
         child: Text("OK"),
       )
     ],
    );
  }
}
