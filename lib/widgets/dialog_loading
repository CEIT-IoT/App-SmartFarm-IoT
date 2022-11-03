import 'package:flutter/material.dart';

void DialogLoading(BuildContext context, String content){
  showDialog(context: context, builder: (_) => Dialog(
    child: Container(
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 25,),
          Text(content)
        ],
      ),
    ),
  ));
}