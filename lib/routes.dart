import 'package:flutter/material.dart';

import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/listpage.dart';
import 'package:flutter_app/pages/detailpage.dart';
import 'package:flutter_app/pages/postlist.dart';

import 'package:flutter_app/pages/test.dart';


final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => new MyHomePage(title: 'Flutter Demo Home Page'),
  '/postlistpage': (BuildContext context) => new PostListPage(),
  '/listpage': (BuildContext context) => new ListPage(),
  '/detail': (BuildContext context) => new DetailPage(id: null),
  '/test': (BuildContext context) => new TestPage(),
};
