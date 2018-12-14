
import 'dart:async';

import 'package:FlutterNews/pages/info/info.dart';
import 'package:FlutterNews/util/bloc_provider.dart';
import 'package:FlutterNews/pages/featured/content_featured.dart';
import 'package:FlutterNews/pages/news/content_news.dart';
import 'package:flutter/material.dart';

class HomeBloc implements BlocBase{

  StreamController<int> _tabPositionController = StreamController<int>();
  StreamController<Widget> _screenController = StreamController<Widget>();

  Function(int) get selectTab => _tabPositionController.sink.add;
  Stream<int> get tabPosition => _tabPositionController.stream;

  Function(Widget) get addWidget => _screenController.sink.add;
  Stream<Widget> get widgetSelected => _screenController.stream;

  HomeBloc(){
    selectTab(0);
    addWidget(ContentFeaturedPage());

    tabPosition.listen((position){

      switch(position){
        case 0: addWidget(ContentFeaturedPage.create());break;
        case 1: addWidget(ContentNewsPage.create());break;
        default: addWidget(Info());

      }

    });
  }

  @override
  void dispose() {
    _tabPositionController.close();
    _screenController.close();
  }

}