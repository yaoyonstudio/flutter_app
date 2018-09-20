
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/listpage.dart';
import 'package:flutter_app/pages/detailpage.dart';

import 'package:flutter_app/pages/test.dart';


final routes = {
  '/': (context) => new MyHomePage(title: 'Flutter Demo Home Page'),
  '/listpage': (context) => new ListPage(),
  '/detail': (context) => new DetailPage(id: null),
  '/test': (context) => new TestPage(),
};
