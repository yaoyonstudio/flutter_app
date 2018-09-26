import 'package:flutter/material.dart';

import 'package:flutter_app/services/post_services.dart';
// import 'package:flutter_app/components/post-list.dart';
import 'package:flutter_app/components/post-item.dart';
//import 'package:flutter_app/models/post.dart';

class ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;
  int page = 1;
  int pageSize = 10;
  List<dynamic> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文章列表'),
      ),
      body: Container(
        child: Center(
          child: new FutureBuilder<List>(
            future: fetchPostList(page),
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
                    if (snapshot.data.length > 0) {
                      if (posts.length > 0) {
                        posts = posts..addAll(snapshot.data);
                        isLoading = false;
                      } else {
                        posts = snapshot.data;
                        isLoading = false;
                      }
                    }
                    return posts.length > 0
                      // ? new PostListView(posts: snapshot.data)
                      ? new NotificationListener(
                        child: new Container(
                          child: new ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return new PostItem(post: posts[index]);
                            },
                            itemCount: posts.length,
                            controller: _scrollController,
                          ),
                        ),
                        onNotification: _onNotification,
                      )
                      : Text('没有文章', style: TextStyle(color: Colors.black54, fontSize: 12.0,),);
                  }
              }
            },
          ),
        ),
      ),
    );
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_scrollController.position.maxScrollExtent > _scrollController.offset && _scrollController.position.maxScrollExtent - _scrollController.offset <= 50) {
        if (isLoading) {
          print('loading');
        } else {
          isLoading = true;
          print('load more');
          setState(() {
            page = page + 1;
          });
        }
      }
    }
    return true;
  }

  @override
  // getPostList() async {
  //   if (!isPerformingRequest) {
  //     setState(() => isPerformingRequest = true);
  //     List<int> newEntries = await fakeRequest(items.length, items.length + 10);
  //     setState(() {
  //       items.addAll(newEntries);
  //       isPerformingRequest = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class ListPage extends StatefulWidget {

  @override
  ListPageState createState() => new ListPageState();

}
