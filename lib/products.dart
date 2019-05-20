import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(context, '/product/'+ index.toString())
                    .then((bool value) {
                      if (value){
                        deleteProduct(index);
                      }
                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard =
        Center(child: Text('No Products found, please add some'));
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      //empty
      productCard = Container();
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    //ListView is used when you know the exact amount of data you will have.
    // return ListView(
    //   children: products
    //       .map((element) => Card(
    //             child: Column(
    //               children: <Widget>[
    //                 Image.asset('assets/food.jpg'),
    //                 Text(element),
    //               ],
    //             ),
    //           ))
    //       .toList(),
    // );
    print('[Products Widget] build()');
    return _buildProductList();

    //   return products.length > 0
    //       ? ListView.builder(
    //           itemBuilder: _buildProductItem,
    //           itemCount: products.length,
    //         )
    //       : Center(child: Text('No Products found, please add some'));
  }
}
