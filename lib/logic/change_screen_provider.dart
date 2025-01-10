import 'package:flutter/foundation.dart';
import 'package:flutter_application_liked/model/data_repo.dart';
import 'package:flutter_application_liked/model/product_model.dart';

class ChangeScreenProvider extends ChangeNotifier {
  final DataRepo dataRepo;

  List<ProductModel> products = [];

  ChangeScreenProvider(this.dataRepo);

  Future<void> getProduct() async {
    products =await dataRepo.getProduct();
    notifyListeners();
  }
}
