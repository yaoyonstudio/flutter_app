import 'package:flutter/material.dart';

import 'package:flutter_app/services/post_services.dart';
// import 'package:flutter_app/components/post-list.dart';
// import 'package:flutter_app/components/post-item.dart';
//import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/pages/PostListView.dart';

class PostListState extends State<PostListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文章列表'),
      ),
      body: Container(
        child: Center(
          child: new FutureBuilder<List>(
            future: fetchPostList(1),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('没有加载');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return new Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    return snapshot.data.length > 0
                      ? new PostListView(posts: snapshot.data)
                      : Text('没有文章', style: TextStyle(color: Colors.black54, fontSize: 12.0,),);
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}

class PostListPage extends StatefulWidget {

  @override
  PostListState createState() => new PostListState();

}
