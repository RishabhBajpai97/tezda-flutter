import 'package:mobx/mobx.dart';
import 'package:tezda/services/index.dart';
part "auth_store.g.dart";

class AuthStore extends _AuthStore with _$AuthStore {
  static AuthStore? _instance;
  static AuthStore? getInstance() {
    _instance ??= AuthStore();
    return _instance;
  }

  AuthStore() : super();
}

abstract class _AuthStore with Store {
  @observable
  dynamic user;

  @action
  setLoggedInUser(val) {
    user = val;
  }

  @action
  login(Map<String, dynamic> data) async {
    try {
      final user = await authService.login(data);
      print(user);
      setLoggedInUser(user["user"]);
      await preferencesService.setAuthToken(user["token"]);
    } catch (e) {
      throw (e);
    }
  }

  @action
  autoAuthenticate() async {
    try {
      final user = await authService.autoAuthenticate();
      setLoggedInUser(user["user"]);
    } catch (e) {
      throw (e);
    }
  }

  @action
  signup(Map<String, dynamic> data) async {
    try {
      final user = await userService.signup(data);
      setLoggedInUser(user["user"]);
      await preferencesService.setAuthToken(user["token"]);
    } catch (e) {
      throw (e);
    }
  }

  @action
  clearData() async {
    user = null;
    await preferencesService.removeAuthToken();
  }
}
