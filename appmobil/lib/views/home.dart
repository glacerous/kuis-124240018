import 'package:flutter/material.dart';
import 'package:appmobil/models/mobil.dart';
import 'package:appmobil/views/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override 
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(product: cars[index]),
              ),
            );
          },
          title: Text(cars[index].brand+ " " + cars[index].name),
          subtitle: Text("${cars[index].year}"),
          leading: Image.network(cars[index].imageUrl, width: 50, height: 50),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
        );
      },
    );

    // return Scaffold(
    //   appBar: AppBar(backgroundColor: Colors.blue, title: Text("Home")),
    //   body: ListView.builder(
    //     itemCount: products.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         onTap: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => DetailPage(product: products[index])
    //             )
    //           );
    //         },
    //         title: Text(products[index].name),
    //         subtitle: Text("Rp ${products[index].price}"),
    //         leading: Image.network(
    //           products[index].image,
    //           width: 50,
    //           height: 50,
    //         ),
    //         trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
    //       );
    //     },
    //   ),
    // );
  }
}
