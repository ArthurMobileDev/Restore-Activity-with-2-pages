import 'package:mobx/mobx.dart';

part 'ModelView.g.dart';

class ModelView = ModelViewBase with _$ModelView;

abstract class ModelViewBase with Store{
  @observable
  String oldValue = '';

  @observable
  String textingValue = '';

  @action
  onChangeText(String text){
    textingValue = text;
  }

  @action
  listenerClickOk() {
    oldValue = textingValue;
  }

}

