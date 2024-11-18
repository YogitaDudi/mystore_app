// import 'package:flutter/material.dart';
// import 'package:mystore/auth/product/provider/product_provider.dart';
// import 'package:mystore/auth/product/view/Product_deatil_scree.dart';
// import 'package:provider/provider.dart';
//
// class ProductScreen extends StatefulWidget {
//   const ProductScreen({super.key});
//
//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }
//
// class _ProductScreenState extends State<ProductScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     Provider.of<ProductProvider>(context, listen: false).fetchProduct();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text("Product Screen"),
//       ),
//       body: Consumer<ProductProvider>(
//         builder: (context, productProvider, child) {
//           if (productProvider.productList.isEmpty) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           return ListView.builder(
//             itemCount: productProvider.productList.length,
//             itemBuilder: (context, index) {
//               final product = productProvider.productList[index];
//               return Card(
//                 child: ListTile(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return ProductDetailsScreen(product: product);
//                     }));
//                   },
//                   title: Text(
//                     product.name ?? "",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(' ${product.description}'),
//                   trailing: Text(
//                     'Price: ₹${product.price}',
//                     style: TextStyle(color: Colors.green),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mystore/auth/product/provider/product_provider.dart';
import 'package:mystore/auth/product/view/Product_deatil_scree.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<ProductProvider>(context, listen: false).fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Product Screen"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.productList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: productProvider.productList.length,
            itemBuilder: (context, index) {
              final product = productProvider.productList[index];
              return Card(
                child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductDetailsScreen(product: product);
                      }));
                    },
                    title: Text(
                      product.name ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(' ${product.description}'),
                    trailing: Text(
                      'Price: ₹${product.price}',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )),
              );
            },
          );
        },
      ),
    );
  }
}
