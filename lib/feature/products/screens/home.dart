import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/feature/products/provider/provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
        return  value.isLoading ? CircularProgressIndicator() : 
          ListView.builder(
            itemCount: value.productList.length,
            
            itemBuilder: (context, index) {
            final product = value.productList[index];

            return ListTile(
              leading: Column(
                children: [
                  Text(product.id.toString()),
                  Text(product.title),
                ],
              ),
              trailing: Text(product.category),
            );
          },);
        },
      ),
    );
  }
}
