import 'dart:developer';
import 'package:get/get.dart';
import 'package:mvvm_api/Api/Repo/get_products_repo.dart';
import 'package:mvvm_api/Api/api_response.dart';
import 'package:mvvm_api/Model/Respose/product_reponse_model.dart';

class GetProductsViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  @override
  onInit() {
    getProductsModel();
    super.onInit();
  }

  Future<void> getProductsModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ProductResponseModel response = await GetProductsRepo.getProducts();

      _apiResponse = ApiResponse.complete(response);
      // CommonSnackBar.showSnackBar(
      //     title: response.status, message: response.message);
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      // CommonSnackBar.showSnackBar(title: 'Something Went Wrong', message: '');
      log('e-------->>>>>>$e');
    }
    update();
  }
}
