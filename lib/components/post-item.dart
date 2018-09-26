import 'package:flutter/material.dart';

import 'package:flutter_app/pages/detailpage.dart';
import 'package:flutter_app/models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
 
  PostItem({Key key, this.post}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(id: post.id)),
          );
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 92.0,
                  height: 60.0,
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Image.network(post.featuredimgurl, fit: BoxFit.cover,),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(post.title, style: TextStyle(color: Colors.black87, fontSize: 14.0, height: 0.82, ), maxLines: 2, softWrap: true, overflow: TextOverflow.ellipsis, ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
                        child: Text(post.date, style: TextStyle(color: Colors.black54, fontSize: 12.0,),),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: new BorderSide(width: 0.5, color: Colors.grey),
        )
      ),
    );
  }
}
