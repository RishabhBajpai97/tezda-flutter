// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStore, Store {
  late final _$productsAtom =
      Atom(name: '_ProductStore.products', context: context);

  @override
  ObservableList<dynamic> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<dynamic> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$selectedProductAtom =
      Atom(name: '_ProductStore.selectedProduct', context: context);

  @override
  dynamic get selectedProduct {
    _$selectedProductAtom.reportRead();
    return super.selectedProduct;
  }

  @override
  set selectedProduct(dynamic value) {
    _$selectedProductAtom.reportWrite(value, super.selectedProduct, () {
      super.selectedProduct = value;
    });
  }

  late final _$getProductsAsyncAction =
      AsyncAction('_ProductStore.getProducts', context: context);

  @override
  Future getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  late final _$clearDataAsyncAction =
      AsyncAction('_ProductStore.clearData', context: context);

  @override
  Future clearData() {
    return _$clearDataAsyncAction.run(() => super.clearData());
  }

  late final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore', context: context);

  @override
  dynamic setProducts(dynamic val) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.setProducts');
    try {
      return super.setProducts(val);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedProduct(dynamic val) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.setSelectedProduct');
    try {
      return super.setSelectedProduct(val);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFavorite(dynamic product) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.addFavorite');
    try {
      return super.addFavorite(product);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeFavorite(dynamic product) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.removeFavorite');
    try {
      return super.removeFavorite(product);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
selectedProduct: ${selectedProduct}
    ''';
  }
}
