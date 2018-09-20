import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/pages/detailpage.dart';


// 获取文章网络请求
Future<Post> fetchPost() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

// 定义文章类
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    print(json);
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}


class ListPage extends StatelessWidget {
  final id = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表页'),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: Text('返回首页'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            new RaisedButton(
              child: Text('详情页'),
              onPressed: () {
//                单纯导航到下一页
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => DetailPage(id: id)),
//                );

                // 导航到下一页，返回时传回值
                _navigateAndDisplay(context);
              },
            ),
            FutureBuilder<Post>(
              future: fetchPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.title);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  _navigateAndDisplay(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(id: id)),
    );
    // 这里接收到来自详情页面的传值
    print(result);
  }
}
