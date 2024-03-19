import 'package:mobx/mobx.dart';
import 'package:tezda/services/index.dart';
import 'package:tezda/store/index.dart';
part "profile_store.g.dart";

class ProfileStore extends _ProfileStore with _$ProfileStore {
  static ProfileStore? _instance;
  static ProfileStore? getInstance() {
    _instance ??= ProfileStore();
    return _instance;
  }
}

abstract class _ProfileStore with Store {
  @observable
  dynamic user;

  @action
  updateUser(Map<String, dynamic> data) async {
    dynamic newUser = await userService.updateUser(data);
    authStore!.setLoggedInUser(newUser); 
  }
}
