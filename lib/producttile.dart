import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'detailsScreen.dart';
import 'model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final int index;

  ProductTile(this.product, this.index);

  void NavDetailsPage(BuildContext context, index) {
    Navigator.of(context).pushNamed(DetailsPage.detailsProduct, arguments: {
      "name": product.name.toString(),
      "brand": product.brand.toString(),
      "image": product.image.toString(),
      "price": product.price.toString(),
      "description": product.description.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavDetailsPage(context, index),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    product.image ?? "",
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(.7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    padding: EdgeInsets.all(7),
                    width: 220,
                    alignment: Alignment.center,
                    child: Text(
                      product.name ?? "",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.broomBall),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Craft Brand : ${product.brand}" ?? "")
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.dollarSign,
                        color: Colors.green[500],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(product.price ?? "")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
