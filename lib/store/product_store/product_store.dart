import 'package:mobx/mobx.dart';
import 'package:tezda/models/products/product.dart';
import 'package:tezda/services/index.dart';
part "product_store.g.dart";

class ProductStore extends _ProductStore with _$ProductStore {
  static ProductStore? _instance;
  static ProductStore? getInstance() {
    _instance ??= ProductStore();
    return _instance;
  }

  ProductStore() : super();
}

abstract class _ProductStore with Store {
  @observable
  ObservableList products = ObservableList<Product>();
  ObservableList favoriteProducts = ObservableList<Product>();

  @observable
  dynamic selectedProduct;

  @action
  setProducts(val) {
    products = val;
  }

  @action
  getProducts() async {
    final productsList = await productService.getProducts();
    setProducts(ObservableList.of(
        productsList.map((element) => Product.fromJson(element))));
  }

  @action
  setSelectedProduct(val) {
    selectedProduct = val;
  }

  @action
  addFavorite(product) {
    product.isFavorite = true;
    favoriteProducts.add(product);
    dynamic sets = favoriteProducts.toSet();
    favoriteProducts = ObservableList.of([...sets]);
  }

  @action
  removeFavorite(product) {
    product.isFavorite = false;
    favoriteProducts.removeWhere((element) => element.id == product.id);
  }

  @action
  clearData() async {
    products = ObservableList();
    selectedProduct = null;
    favoriteProducts = ObservableList();
  }
}
