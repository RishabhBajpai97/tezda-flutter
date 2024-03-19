// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$userAtom = Atom(name: '_ProfileStore.user', context: context);

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

  late final _$updateUserAsyncAction =
      AsyncAction('_ProfileStore.updateUser', context: context);

  @override
  Future updateUser(Map<String, dynamic> data) {
    return _$updateUserAsyncAction.run(() => super.updateUser(data));
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
