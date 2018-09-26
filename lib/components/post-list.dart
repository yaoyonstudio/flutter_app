import 'package:flutter/material.dart';

import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/components/post-item.dart';

class PostListView extends StatelessWidget {
  final List<Post> posts;
 
  PostListView({Key key, this.posts}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new PostItem(post: posts[index]);
        },
        itemCount: posts.length,
      ),
    );
  }
}
