import 'package:FlutterNews/localization/MyLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:FlutterNews/pages/search/search_result.dart';

class SearchWidget extends StatelessWidget{

  final TextEditingController editingController = new TextEditingController();

  MyLocalizations strl;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {

    strl = MyLocalizations.of(context);
    _context = context;

    return new Container(
      padding: new EdgeInsets.only(left: 10.0,right: 10.0,top: 40.0),
      margin: const EdgeInsets.only(),
      child: new Material(
        borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
        elevation: 2.0,
        child: new Container(
          height: 45.0,
          margin: new EdgeInsets.only(left: 16.0,right: 16.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                    maxLines: 1,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.search, color: Theme.of(context).accentColor,),
                      hintText: strl.trans("hint_busca"),
                      border: InputBorder.none
                    ),
                    onSubmitted: onSubmitted,
                    controller: editingController,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  onSubmitted(query){

    Navigator.of(_context).push(
          new MaterialPageRoute(builder: (BuildContext context) {
            return SearchResultPage.create(query);
          }
        )
    );

  }
  
}