import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/pages/detailpage.dart';


// 获取文章网络请求
//Future<Post> fetchPost(int id) async {
//  final response = await http.get('https://jsonplaceholder.typicode.com/posts/' + id.toString());
//
//  if (response.statusCode == 200) {
//    // If the call to the server was successful, parse the JSON
//    return Post.fromJson(json.decode(response.body));
//  } else {
//    // If that call was not successful, throw an error.
//    throw Exception('Failed to load post');
//  }
//}

// 定义文章类
//class Post {
//  final int userId;
//  final int id;
//  final String title;
//  final String body;
//
//  Post({this.userId, this.id, this.title, this.body});

//  static List<Post> postLists(List<Post> list) {
//    var posts = new List<Post>();
//    return posts;
//  }

//  factory Post.fromJson(Map<String, dynamic> json) {
//    return Post(
//      userId: json['userId'],
//      id: json['id'],
//      title: json['title'],
//      body: json['body'],
//    );
//  }
//}

class PostListState extends State<ListPage> {
  static const API_URL = 'https://www.thatyou.cn/wp-json/wp/v2';
//  final String url = 'https://jsonplaceholder.typicode.com/posts';

  String url = API_URL + '/posts';

  List data;

  Future<String> fetchPostList() async {
    var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
      print(data);
      return 'Success!';
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文章列表'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Container(
                  padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 92.0,
                        height: 60.0,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Image.network(data[index]["featuredimgurl"], fit: BoxFit.cover,),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(data[index]["title"], style: TextStyle(color: Colors.black87, fontSize: 13.0, height: 0.82, ), maxLines: 2, softWrap: true, overflow: TextOverflow.ellipsis, ),
                            Text(data[index]["datestr"], style: TextStyle(color: Colors.black54, fontSize: 11.0,),),
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
        },
        itemCount: data == null ? 0 : data.length,
      ),
    );
  }

  @override
  void initState() {
    print('init');
    super.initState();
    this.fetchPostList();
  }
}

class ListPage extends StatefulWidget {

  @override
  PostListState createState() => new PostListState();

//  final id = 10;

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('列表页'),
//      ),
//      body: Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new RaisedButton(
//              child: Text('返回首页'),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            ),
//            new RaisedButton(
//              child: Text('详情页'),
//              onPressed: () {
////                单纯导航到下一页
////                Navigator.push(
////                  context,
////                  MaterialPageRoute(builder: (context) => DetailPage(id: id)),
////                );
//
//                // 导航到下一页，返回时传回值
//                _navigateAndDisplay(context);
//              },
//            ),
//            FutureBuilder<Post>(
//              future: fetchPost(1),
//              builder: (context, snapshot) {
//                if (snapshot.hasData) {
//                  return Text(snapshot.data.title);
//                } else if (snapshot.hasError) {
//                  return Text("${snapshot.error}");
//                }
//
//                // By default, show a loading spinner
//                return CircularProgressIndicator();
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  _navigateAndDisplay(BuildContext context) async {
//    final result = await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => DetailPage(id: id)),
//    );
//    // 这里接收到来自详情页面的传值
//    print(result);
//  }
}
