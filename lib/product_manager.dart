import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget {
//   final Map<String, String> startingProduct;

//   ProductManager({this.startingProduct}) {
//     print('[ProductManager Wdiget] Constructor');
//   }

//   @override
//   State<StatefulWidget> createState() {
//     print('[ProductManager Wdiget] createState()');
//     return _ProductManagerState();
//   }
// }

// class _ProductManagerState extends State<ProductManager> {
//   List<Map<String, String>> _products = [];

//   //widget is only available in the init method to access parent class string when this state is created
//   @override
//   void initState() {
//     print('[ProductManager State] initState()');
//     if (widget.startingProduct != null) {
//       _products.add(widget.startingProduct);
//     }
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(ProductManager oldWidget) {
//     print('[ProductManager State] didUpdateWidget()');
//     super.didUpdateWidget(oldWidget);
//   }

final List<Map<String, String>> products;
final Function addProduct;
final Function deleteProduct;

ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Expanded(child:Products(products, deleteProduct: deleteProduct))
      ],
    );
  }
}
