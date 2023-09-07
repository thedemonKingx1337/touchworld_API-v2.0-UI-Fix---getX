import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  static const detailsProduct = "/details-page";
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final productName = routeArguments["name"];
    final productBrand = routeArguments["brand"];
    final productImage = routeArguments["image"];
    final productPrice = routeArguments["price"];
    final productDescription = routeArguments["description"];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                productImage!,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productName!,
                    style: TextStyle(fontSize: 25),
                  ),
                  Card(
                    color: Colors.amber,
                    margin: EdgeInsets.only(left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(productBrand!),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Price :"),
                    Text(
                      "  \$ ${productPrice}",
                      style: TextStyle(color: Colors.green[800], fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Text(
                productDescription ?? "",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
