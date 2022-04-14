// just color and design of containers jo note add hn ga

import 'package:flutter/material.dart';

class Product {
  final String title, desc;
  final Color color;
  Product({
    required this.title,
    required this.desc,
    required this.color,
  });
}

List<Product> products = [
  Product(
    title: "Title",
    color: const Color.fromARGB(255, 115, 205, 253),
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
  ),
  Product(
    title: "Title",
    color: const Color(0xFFff6374),
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
  ),
  Product(
    title: "Title",
    color: const Color(0xFFffaa5b),
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
  ),
  Product(
    title: "Title",
    color: const Color.fromARGB(255, 115, 205, 253),
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
  ),
];
