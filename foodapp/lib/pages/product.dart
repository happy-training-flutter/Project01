import 'package:flutter/material.dart';
import 'package:foodapp/controller/productCard.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}

final List<Product> products = [
  Product(
    id: 1,
    title: "Wireless Bluetooth Earbuds",
    price: 29.99,
    imageUrl:
        "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
  ),
  Product(
    id: 2,
    title: "Smartphone Stand with Cooling Fan",
    price: 15.50,
    imageUrl:
        "https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&w=800&q=80",
  ),
  Product(
    id: 3,
    title: "Stainless Steel Water Bottle",
    price: 18.99,
    imageUrl:
        "https://images.pexels.com/photos/14111841/pexels-photo-14111841.jpeg?auto=compress&cs=tinysrgb&w=800&q=80",
  ),
  Product(
    id: 4,
    title: "LED Desk Lamp",
    price: 24.75,
    imageUrl:
        "https://images.pexels.com/photos/8413371/pexels-photo-8413371.jpeg?auto=compress&cs=tinysrgb&w=800&q=80",
  ),
  Product(
    id: 5,
    title: "Portable Power Bank 20000mAh",
    price: 34.99,
    imageUrl:
        "https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
  ),
];

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Product Listing'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Productcard(
              image: products[index].imageUrl,
              product: products[index].title,
              price: products[index].price.toString(),
            );
          }),
    );
  }
}
