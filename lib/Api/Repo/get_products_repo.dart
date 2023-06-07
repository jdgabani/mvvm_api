import 'dart:convert';

import 'package:mvvm_api/Api/ApiRoutes/api_routes.dart';
import 'package:mvvm_api/Model/Respose/product_reponse_model.dart';
import '../api_handlers.dart';

class GetProductsRepo {
  static Future<ProductResponseModel> getProducts() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: ApiRoutes.getProducts);

    ProductResponseModel productsResponseModel =
    productResponseModelFromJson(jsonEncode(response));

    return productsResponseModel;
  }
}
