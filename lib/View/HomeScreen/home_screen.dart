import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_api/Api/api_response.dart';
import 'package:mvvm_api/Model/Respose/product_reponse_model.dart';
import 'package:mvvm_api/ViewModel/get_products_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetProductsViewModel getProductsViewModel = Get.put(GetProductsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<GetProductsViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == Status.COMPLETE) {
              ProductResponseModel data = controller.apiResponse.data;

              return Text(data.products[0].title);
            } else if (controller.apiResponse.status == Status.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.apiResponse.status == Status.ERROR) {
              return Center(
                child: Text('${controller.apiResponse.message}'),
              );
            } else {
              return const Center(
                child: Text('Something went Wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
