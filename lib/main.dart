import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restore_activity/HomePage.dart';
import 'package:restore_activity/ModelView.dart';


void main(){
  GetIt.instance.registerSingleton<ModelView>(ModelView());

  runApp(App());
}

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App>{
  final modelView = GetIt.instance.get<ModelView>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restore Activity',
      restorationScopeId: 'root',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }

}