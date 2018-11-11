import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),//AppBar
      body: new _MyList(),
    );//Scaffold
  }
}

class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemBuilder: (context, i) {
        return new ListTile(
          title: new Text('Some Random Username'),
          subtitle: new Text('Online', style: new TextStyle(fontStyle: FontStyle.italic, color: Colors.green),),
          leading: const Icon(Icons.face),
          trailing: new RaisedButton(
            child: new Text('Remove'),
            onPressed: (){
              deleteDialog(context).then((value){
                print('Value is $value');
              });
            },
          ),
        );//ListTile
      },//ListView.builder
    );//ListView
  }
}

Future<bool> deleteDialog(BuildContext context){
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
          return new AlertDialog(
            title: new Text('Are you sure?'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: new Text('Yes'),
              ),//FlatButton
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: new Text('No'),
              ),//FlatButton
            ],//<Widget>[]
          );//AlertDIalog
    },
  );
}