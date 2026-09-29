import 'package:flutter/material.dart';
import 'package:appmobil/models/mobil.dart';

class DetailPage extends StatelessWidget {
  final Car product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 161, 63),
        foregroundColor: Colors.white,
        title: Text("${product.name }"),
      ),
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.imageUrl),
              Text("${product.brand} ${product.name} ${product.year}"),
              Text("Rp. ${product.price}"),
              Text(product.description),
              // ElevatedButton(
              //   onPressed: (){
              //     Navigator.pop(context);
              //   }, 
              //   child: Text("Kembali")
              // )
            ],
          ),
        ),
      ),
    );
  }
}
