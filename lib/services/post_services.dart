import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/post.dart';


Future<List<Post>> fetchPostList(int page) async {
  var pagesize = 12;
  var url = API_URL + '/posts/?per_page=' + pagesize.toString() + '&page=' + page.toString();
  var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    List<Post> posts = [];
    if (data.length == 0) {
      return [];
    }
    data.forEach((post) => posts.add(Post.fromJson(post)));
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}

// 获取文章网络请求
Future<Post> fetchPost(int id) async {
  final response = await http.get(API_URL + '/posts/' + id.toString());
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}


