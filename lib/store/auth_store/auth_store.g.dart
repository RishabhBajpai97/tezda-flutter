// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$userAtom = Atom(name: '_AuthStore.user', context: context);

  @override
  dynamic get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(dynamic value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStore.login', context: context);

  @override
  Future login(Map<String, dynamic> data) {
    return _$loginAsyncAction.run(() => super.login(data));
  }

  late final _$autoAuthenticateAsyncAction =
      AsyncAction('_AuthStore.autoAuthenticate', context: context);

  @override
  Future autoAuthenticate() {
    return _$autoAuthenticateAsyncAction.run(() => super.autoAuthenticate());
  }

  late final _$signupAsyncAction =
      AsyncAction('_AuthStore.signup', context: context);

  @override
  Future signup(Map<String, dynamic> data) {
    return _$signupAsyncAction.run(() => super.signup(data));
  }

  late final _$clearDataAsyncAction =
      AsyncAction('_AuthStore.clearData', context: context);

  @override
  Future clearData() {
    return _$clearDataAsyncAction.run(() => super.clearData());
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  dynamic setLoggedInUser(dynamic val) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setLoggedInUser');
    try {
      return super.setLoggedInUser(val);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
