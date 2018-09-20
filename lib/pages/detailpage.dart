import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int id;

  DetailPage({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  // 从详情页面传值回上个页面
                  Navigator.pop(context, this.id + 10);
                },
                child: Text('返回'),
              ),
              new Text('页面ID: ${id}'),
            ],
          )
      ),
    );
  }
}
