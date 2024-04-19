import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:restore_activity/ModelView.dart';

class SecondPage extends StatefulWidget{
  const SecondPage({super.key});
  @override
  State<StatefulWidget> createState() => SecondPageState();
}


class SecondPageState extends State<SecondPage> with RestorationMixin{
  final modelView = GetIt.instance.get<ModelView>();
  final value = RestorableString('');

  @override
  Widget build(BuildContext context) {
    if (modelView.oldValue.isNotEmpty) {
      value.value = modelView.oldValue;
    } else {
      modelView.oldValue = value.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.black38,
      ),

      body: Center(
          child: Observer(
              builder: (_) {
                return Text(value.value);
              }
          )
      ),
    );

  }

  @override
  String? get restorationId => "second_page";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(value, 'old_value');
  }

}