import 'package:flutter/material.dart';

import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/services/post_services.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FutureBuilder<Post>(
                future: fetchPost(id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var post = snapshot.data;
                    return Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(post.title, style: TextStyle(fontSize: 22.0, color: Colors.black87,)),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          )
      ),
    );
  }
}
