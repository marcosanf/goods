import 'package:get/get.dart';

class WelcomeController extends GetxController {
// final MyRepository repository;
// WelcomeController({@required this.repository}) : assert(repository != null);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
