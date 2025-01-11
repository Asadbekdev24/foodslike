import 'package:flutter/foundation.dart';
import 'package:flutter_application_liked/model/data_repo.dart';
import 'package:flutter_application_liked/model/product_model.dart';

class ChangeScreenProvider extends ChangeNotifier {
  final DataRepo dataRepo;

  bool _isLiked = false;
  List<ProductModel> products = [];

  bool get isLiked => _isLiked;

  void toggleLike() {
    _isLiked = !_isLiked;
  } 



  void itemLike(int id) {
    // int index = products.indexWhere((ele) => ele.id == id);

      products[id].isFavorite = !products[id].isFavorite;
      notifyListeners();

  }

  ChangeScreenProvider(this.dataRepo);

  Future<void> getProduct() async {
    products = await dataRepo.getProduct();
    notifyListeners();
  }

  List<ProductModel> tanlangan = [];

  void tanlanganFoodlar(ProductModel product) {
    tanlangan.add(product);
  }

  void ochirilganFoodItem(ProductModel product) {
    tanlangan.remove(product);
  }
}
