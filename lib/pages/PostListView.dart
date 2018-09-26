import 'package:flutter/material.dart';

import 'package:flutter_app/services/post_services.dart';
// import 'package:flutter_app/components/post-list.dart';
import 'package:flutter_app/components/post-item.dart';
//import 'package:flutter_app_app/models/post.dart';

class PostListViewState extends State<PostListView> {
  ScrollController _scrollController = new ScrollController();
  List<dynamic> posts;
  bool isLoading = false;
  int page = 1;
  int pageSize = 10;

  @override
  void initState() {
    posts = widget.posts;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_scrollController.position.maxScrollExtent > _scrollController.offset && _scrollController.position.maxScrollExtent - _scrollController.offset <= 50) {
        if (isLoading) {
          print('loading');
        } else {
          isLoading = true;
          print('load more');
          fetchPostList(page + 1).then((postObj){
            setState(() {
              page = page + 1;
              posts.addAll(postObj);
            });
            isLoading = false;
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
  Widget build(BuildContext context) {
    return new NotificationListener(
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
    );
  }
}



class PostListView extends StatefulWidget {

  final List<dynamic> posts;

  PostListView({Key key, this.posts}):super(key: key);

  @override
  PostListViewState createState() => new PostListViewState();

}

