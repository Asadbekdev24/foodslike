import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_liked/model/datajson.dart';
import 'package:flutter_application_liked/model/product_model.dart';

class DataRepo {
  Future<List<ProductModel>> getProduct() async {
    try {
      // Simulate a delay
      await Future.delayed(Duration(seconds: 2));

      // Decode JSON data
      List<dynamic> foods = jsonDecode(Datajson.data);

      // Convert to list of ProductModel
      List<ProductModel> dartObyektilari = foods
          .map(
            (e) => ProductModel.fromJson(e),
          )
          .toList();

      log(dartObyektilari.toString());
      return dartObyektilari;
    } catch (e) {
      log('Error decoding JSON: $e');
      return []; // Return an empty list in case of an error
    }
  }
}
