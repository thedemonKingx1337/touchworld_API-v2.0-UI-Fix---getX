import 'package:flutter/material.dart';
import 'apiController.dart';
import 'package:get/get.dart';
import 'detailsScreen.dart';
import 'producttile.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => HomeMain(),
      DetailsPage.detailsProduct: (context) => DetailsPage(),
    },
  ));
}

class HomeMain extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 194, 194),
        title: Text(
          "Product List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return ProductTile(productController.productList[index], index);
            },
          );
        }
      }),
    );
  }
}
