import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/feature/products/provider/provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.productList.isEmpty) {
            return const Center(child: Text("No products found"));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: provider.productList.length,

            itemBuilder: (context, index) {
              final product = provider.productList[index];
              return Card(
                child: Column(
                  children: [
                    Text(product.id.toString()),
                    Expanded(child: Image.network(product.image,fit: BoxFit.cover,)),
                    Row(
                      children: [
                        Text('Name :',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                        Expanded(child: Text(product.title,overflow: TextOverflow.ellipsis)),
                      ],
                    )  
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
